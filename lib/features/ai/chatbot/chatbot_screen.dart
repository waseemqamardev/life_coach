import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/ai/gemini_client.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../generated/assets.dart';
import '../../../shared/widgets/rtl_aware.dart';
import '../../../providers/providers.dart';
import '../../../l10n/app_localizations.dart';

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}

class ChatbotScreen extends ConsumerStatefulWidget {
  const ChatbotScreen({super.key});

  @override
  ConsumerState<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends ConsumerState<ChatbotScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  bool _isTyping = false;
  bool _sendButtonActive = false;

  @override
  void initState() {
    super.initState();
    _textController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _textController.removeListener(_onTextChanged);
    _textController.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final bool active = _textController.text.trim().isNotEmpty;
    if (active != _sendButtonActive) {
      setState(() {
        _sendButtonActive = active;
      });
    }
  }

  Future<void> _sendMessage() async {
    final String text = _textController.text.trim();
    if (text.isEmpty || _isTyping) return;

    _textController.clear();
    setState(() {
      _messages.insert(
          0, ChatMessage(text: text, isUser: true, timestamp: DateTime.now()));
      _isTyping = true;
    });

    _scrollToTop();

    try {
      final List<ChatMessage> chronological = _messages.reversed.toList();
      final List<({bool isUser, String text})> prior = chronological
          .sublist(0, chronological.length - 1)
          .map((ChatMessage m) => (isUser: m.isUser, text: m.text))
          .toList();

      final String aiResponse = await GeminiClient.instance.chat(
        userMessage: text,
        priorMessages: prior,
        locale: ref.read(localeProvider),
      );

      if (!mounted) return;
      setState(() {
        _isTyping = false;
        _messages.insert(
            0,
            ChatMessage(
                text: aiResponse, isUser: false, timestamp: DateTime.now()));
      });
    } catch (_) {
      if (!mounted) return;
      final l10n = context.l10n;
      setState(() {
        _isTyping = false;
        _messages.insert(
            0,
            ChatMessage(
                text: l10n.chatbotErrorMessage,
                isUser: false,
                timestamp: DateTime.now()));
      });
    }
    _scrollToTop();
  }

  void _scrollToTop() {
    Future<void>.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.scaffoldColor(context),
      // bottomNavigationBar: const AppBottomNav(currentIndex: 1),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            // Bottom decorative wave background
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: IgnorePointer(
                child: SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: Image.asset(
                    isDark
                        ? Assets.imagesBackGroundWaveDark
                        : Assets.imagesBackGroundWaveLight,
                    fit: BoxFit.fill,
                    alignment: Alignment.bottomCenter,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),

            // Core screen column
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Custom Navigation Header
                _buildHeader(context, l10n, isDark),

                // Main content: either start state or message listing
                Expanded(
                  child: _messages.isEmpty
                      ? _buildStartState(l10n, isDark)
                      : _buildMessageList(isDark),
                ),

                _buildInputSection(l10n, isDark),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static String _titleLeading(String title) {
    final int space = title.lastIndexOf(' ');
    if (space < 0) return title;
    return '${title.substring(0, space)} ';
  }

  static String _titleAccent(String title) {
    final int space = title.lastIndexOf(' ');
    if (space < 0) return '';
    return title.substring(space + 1);
  }

  Widget _buildHeader(
    BuildContext context,
    AppLocalizations l10n,
    bool isDark,
  ) {
    final String title = l10n.chatbotTitle;

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 8),
      child: Row(
        children: <Widget>[
          RtlBackIconButton(
            onPressed: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              } else {
                context.go(AppRoutes.home);
              }
            },
            size: 24,
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                    text: _titleLeading(title),
                    style: AppTextStyles.h3.copyWith(
                      color: AppColors.textPrimary(context),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: _titleAccent(title),
                    style: AppTextStyles.h3.copyWith(
                      color: isDark
                          ? AppColors.textPrimary(context)
                          : AppColors.primaryPurple,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 44),
        ],
      ),
    );
  }

  Widget _buildStartState(AppLocalizations l10n, bool isDark) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 40),
            // Brain logo representing Life Coach
            Image.asset(
              Assets.iconsAiChatBot,
              height: 141,
              width: 144,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isDark ? AppColors.darkSurface : const Color(0xffEEEDFD),
                ),
                child: const Icon(
                  Icons.psychology_rounded,
                  size: 80,
                  color: AppColors.primaryPurple,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              l10n.aiNavigator,
              style: AppTextStyles.h2.copyWith(
                color: isDark ? Colors.white : const Color(0xFF022088),
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              l10n.chatbotReadySubtitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.textMuted(context),
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageList(bool isDark) {
    return ListView.builder(
      controller: _scrollController,
      reverse: true, // Newest messages at the bottom
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      physics: const BouncingScrollPhysics(),
      itemCount: _messages.length + (_isTyping ? 1 : 0),
      itemBuilder: (BuildContext context, int index) {
        if (_isTyping && index == 0) {
          return _buildTypingBubble(isDark);
        }

        final int msgIndex = _isTyping ? index - 1 : index;
        final ChatMessage message = _messages[msgIndex];
        return _buildMessageBubble(message, isDark);
      },
    );
  }

  Widget _buildMessageBubble(ChatMessage message, bool isDark) {
    if (message.isUser) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width * 0.72,
                ),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xff2A2359)
                      : const Color(0xffEEEDFD),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Text(
                  message.text,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.white : AppColors.textMuted(context),
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      // AI Message bubble with avatar
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // AI mic avatar
            _buildAiAvatar(isDark),
            const SizedBox(width: 8),
            Flexible(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width * 0.70,
                ),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkCard : const Color(0xffF1F1F1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Text(
                  message.text,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.white : AppColors.textMuted(context),
                    fontSize: 14,
                    height: 1.45,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildTypingBubble(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAiAvatar(isDark),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkCard : const Color(0xffF1F1F1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: const ThreeDotsIndicator(),
          ),
        ],
      ),
    );
  }

  Widget _buildAiAvatar(bool isDark) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1B2347) : const Color(0xffEEEDFD),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(
          Assets.iconsAiVoice,
          height: 16,
          width: 16,
          fit: BoxFit.contain,
          color: isDark ? Colors.white : null,
          colorBlendMode: isDark ? BlendMode.srcIn : null,
        ),
      ),
    );
  }

  Widget _buildInputSection(AppLocalizations l10n, bool isDark) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24, 8, 24, 40),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: isDark
              ? Border.all(color: AppColors.darkBorder)
              : null,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: <Widget>[
              // Microphone button
              _buildIconButton(
                icon: Assets.iconsAiVoice,
                isDark: isDark,
                onTap: () {},
              ),
              const SizedBox(width: 4),
              // Attachment button
              _buildIconButton(
                icon: Assets.iconsAiAttach,
                isDark: isDark,
                onTap: () {},
              ),
              const SizedBox(width: 6),
              // Text Field
              Expanded(
                child: TextField(
                  controller: _textController,
                  focusNode: _focusNode,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => _sendMessage(),
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: isDark ? Colors.white : AppColors.textPrimary(context),
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: l10n.chatbotInputHint,
                    hintStyle: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w500,
                      color: isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.textMuted(context),
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                  ),
                  minLines: 1,
                  maxLines: 4,
                ),
              ),
              const SizedBox(width: 8),
              // Send Button
              _buildSendButton(isDark),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required String icon,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1B2347) : const Color(0xffEEEDFD),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Image.asset(
            icon,
            width: 16,
            height: 16,
            fit: BoxFit.contain,
            color: isDark ? Colors.white : null,
            colorBlendMode: isDark ? BlendMode.srcIn : null,
          ),
        ),
      ),
    );
  }

  Widget _buildSendButton(bool isDark) {
    final Widget sendIcon = Image.asset(
      Assets.iconsAiSend,
      width: 16,
      height: 16,
      fit: BoxFit.contain,
      color: _sendButtonActive
          ? (isDark ? Colors.white : null)
          : (isDark ? Colors.white.withValues(alpha: 0.45) : null),
      colorBlendMode: isDark ? BlendMode.srcIn : null,
    );

    if (_sendButtonActive) {
      return GestureDetector(
        onTap: _sendMessage,
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isDark
                ? AppColors.primaryPurple
                : AppColors.selectedFillColor(context),
            shape: BoxShape.circle,
          ),
          child: Center(child: sendIcon),
        ),
      );
    }

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.08)
            : const Color(0xffF9F9FB),
        shape: BoxShape.circle,
      ),
      child: Center(child: sendIcon),
    );
  }
}

class ThreeDotsIndicator extends StatefulWidget {
  const ThreeDotsIndicator({super.key});

  @override
  State<ThreeDotsIndicator> createState() => _ThreeDotsIndicatorState();
}

class _ThreeDotsIndicatorState extends State<ThreeDotsIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color dotColor = isDark ? Colors.white70 : AppColors.primaryPurple;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.generate(3, (int index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            final double delay = index * 0.2;
            final double value = (math.sin(
                        (_controller.value * 2 * math.pi) - (delay * math.pi)) +
                    1) /
                2;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2.5),
              width: 6,
              height: 6,
              transform: Matrix4.translationValues(0, -value * 5, 0),
              decoration: BoxDecoration(
                color: dotColor.withValues(alpha: 0.35 + 0.65 * value),
                shape: BoxShape.circle,
              ),
            );
          },
        );
      }),
    );
  }
}
