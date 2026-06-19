import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/supported_languages.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/l10n/rtl_layout.dart';
import '../../../core/services/storage_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../providers/providers.dart';
import '../../../generated/assets.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/rtl_aware.dart';
import '../../splash/splash_screen.dart';

enum LanguageFlow { onboarding, settings }

class LanguageScreen extends ConsumerStatefulWidget {
  const LanguageScreen({super.key, this.flow = LanguageFlow.settings});

  final LanguageFlow flow;

  @override
  ConsumerState<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends ConsumerState<LanguageScreen> {
  final TextEditingController _searchCtrl = TextEditingController();

  late String _selectedId;

  bool get _fromSettings => widget.flow == LanguageFlow.settings;

  @override
  void initState() {
    super.initState();
    _selectedId = SupportedLanguage.idFromLocale(ref.read(localeProvider));
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  List<SupportedLanguage> get _filtered {
    final String query = _searchCtrl.text.trim().toLowerCase();
    if (query.isEmpty) return SupportedLanguage.all;
    return SupportedLanguage.all
        .where((SupportedLanguage lang) =>
            lang.label.toLowerCase().contains(query))
        .toList();
  }

  void _goBack() {
    if (_fromSettings) {
      context.pop();
    } else {
      context.go(AppRoutes.splash);
    }
  }

  Future<void> _applyLanguage() async {
    await ref.read(localeProvider.notifier).setLanguageId(_selectedId);
    await StorageService.instance.setBool(StorageService.kLanguageChosen, true);
    if (!mounted) return;

    if (_fromSettings) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.languageChanged)),
      );
      context.pop();
      return;
    }

    context.go(AppRoutes.onboarding);
  }

  @override
  Widget build(BuildContext context) {
    final List<SupportedLanguage> items = _filtered;
    final l10n = context.l10n;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return RtlLayout.fromLanguageId(
      languageId: _selectedId,
      child: PopScope(
        canPop: _fromSettings,
        onPopInvokedWithResult: (bool didPop, Object? result) {
          if (!didPop && !_fromSettings) _goBack();
        },
        child: Scaffold(
          backgroundColor: AppColors.scaffoldColor(context),
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              if (isDark) const DarkTopGlow() else const LightTopGlow(),
              PositionedDirectional(
                start: 0,
                end: 0,
                bottom: 0,
                child: IgnorePointer(
                  child: _LanguageWaveFooter(isDark: isDark),
                ),
              ),
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: context.headerBackPadding,
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: RtlBackIconButton(onPressed: _goBack, size: 22),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      child: _SelectLanguageTitle(
                        selectWord: l10n.selectLanguage,
                        languageWord: l10n.languageWord,
                        isDark: isDark,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                        decoration: BoxDecoration(
                          color: AppColors.cardColor(context),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                            bottom: Radius.circular(12),
                          ),
                          border: isDark
                              ? Border.all(color: AppColors.borderColor(context))
                              : null,
                          boxShadow: AppColors.homeCardShadow(context),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                16,
                                18,
                                16,
                                12,
                              ),
                              child: _LanguageSearchField(
                                controller: _searchCtrl,
                                hint: l10n.searchLanguageHint,
                                onChanged: (_) => setState(() {}),
                              ),
                            ),
                            Expanded(
                              child: items.isEmpty
                                  ? Center(
                                      child: Text(
                                        l10n.noLanguagesFound,
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.bodySmall.copyWith(
                                          color: AppColors.textMuted(context),
                                        ),
                                      ),
                                    )
                                  : ListView.separated(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                        16,
                                        0,
                                        16,
                                        20,
                                      ),
                                      itemCount: items.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 10),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final SupportedLanguage option =
                                            items[index];
                                        final bool isSelected =
                                            _selectedId == option.id;
                                        return _LanguageRow(
                                          label: option.label,
                                          iconAsset: option.iconAsset,
                                          isSelected: isSelected,
                                          onTap: () => setState(
                                            () => _selectedId = option.id,
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 28),
                      child: CustomGradientButton(
                        text: l10n.continueButton,
                        onTap: _applyLanguage,
                        showArrow: true,
                        showSparkle: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SelectLanguageTitle extends StatelessWidget {
  const _SelectLanguageTitle({
    required this.selectWord,
    required this.languageWord,
    required this.isDark,
  });

  final String selectWord;
  final String languageWord;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      textDirection: Directionality.of(context),
      crossAxisAlignment: WrapCrossAlignment.start,
      children: <Widget>[
        Text(
          '$selectWord ',
          textAlign: TextAlign.start,
          style: AppTextStyles.h2.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.4,
            color: isDark ? Colors.white : const Color(0xFF022088),
            height: 1.1,
          ),
        ),
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (Rect bounds) {
            return AppColors.primaryTwoGradient.createShader(bounds);
          },
          child: Text(
            languageWord,
            textAlign: TextAlign.start,
            style: AppTextStyles.h2.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.4,
              color: Colors.white,
              height: 1.1,
            ),
          ),
        ),
      ],
    );
  }
}

class _LanguageSearchField extends StatelessWidget {
  const _LanguageSearchField({
    required this.controller,
    required this.hint,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hint;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final bool isDark = !AppColors.isLight(context);

    return SizedBox(
      height: 48,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        textAlign: TextAlign.start,
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.textPrimary(context),
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textMuted(context),
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            size: 22,
            color: AppColors.textMuted(context).withValues(alpha: 0.8),
          ),
          filled: true,
          fillColor: isDark
              ? AppColors.surfaceBackground(context)
              : AppColors.cardColor(context),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.borderColor(context).withValues(alpha: 0.95),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.primaryPurple.withValues(alpha: 0.45),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.borderColor(context).withValues(alpha: 0.95),
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageRow extends StatelessWidget {
  const _LanguageRow({
    required this.label,
    required this.iconAsset,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final String iconAsset;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bool isDark = !AppColors.isLight(context);
    final Color unselectedFill = isDark
        ? AppColors.surfaceBackground(context)
        : const Color(0xFFF0F8F9);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          decoration: BoxDecoration(
            gradient: isSelected ? AppColors.primaryTwoGradient : null,
            color: isSelected ? null : unselectedFill,
            borderRadius: BorderRadius.circular(12),
            border: !isSelected && isDark
                ? Border.all(color: AppColors.borderColor(context))
                : null,
          ),
          child: ListTile(
            contentPadding: const EdgeInsetsDirectional.fromSTEB(14, 4, 14, 4),
            leading: ClipOval(
              child: Image.asset(
                iconAsset,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 40,
                  height: 40,
                  color: AppColors.cardColor(context),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.language_rounded,
                    size: 22,
                    color: AppColors.textMuted(context),
                  ),
                ),
              ),
            ),
            title: Text(
              label,
              textAlign: TextAlign.start,
              style: AppTextStyles.bodyMedium.copyWith(
                color: isSelected
                    ? Colors.white
                    : AppColors.textPrimary(context),
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            trailing: RtlRadioIndicator(
              selected: isSelected,
              accentColor:
                  isSelected ? Colors.white : AppColors.primaryPurple,
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageWaveFooter extends StatelessWidget {
  const _LanguageWaveFooter({required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final String asset = isDark
        ? Assets.imagesBackGroundWaveDark
        : Assets.imagesBackGroundWaveLight;

    return SizedBox(
      height: 118,
      width: double.infinity,
      child: Image.asset(
        asset,
        fit: BoxFit.fill,
        alignment: Alignment.bottomCenter,
        filterQuality: FilterQuality.high,
        errorBuilder: (_, __, ___) => const SizedBox.shrink(),
      ),
    );
  }
}
