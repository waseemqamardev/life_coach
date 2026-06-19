import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/services/image_picker_service.dart';
import '../../../core/services/profile_photo_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../generated/assets.dart';
import '../../../providers/providers.dart';
import '../../../shared/widgets/profile_avatar.dart';
import '../../../shared/widgets/rtl_aware.dart';
class PersonalInformationScreen extends ConsumerStatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  ConsumerState<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState
    extends ConsumerState<PersonalInformationScreen> {
  static const Color _titleBlue = Color(0xFF022088);

  late final TextEditingController _nameCtrl;
  late final TextEditingController _emailCtrl;
  late final TextEditingController _phoneCtrl;

  late String _originalName;
  late String _originalEmail;
  late String _originalPhone;
  late String _originalPhotoPath;
  String _displayPhotoPath = '';
  bool _removePhotoPending = false;
  bool _pendingPhotoStaged = false;
  bool _isSaving = false;

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();

  bool get _hasChanges =>
      _nameCtrl.text.trim() != _originalName ||
      _emailCtrl.text.trim() != _originalEmail ||
      _phoneCtrl.text.trim() != _originalPhone ||
      _displayPhotoPath != _originalPhotoPath ||
      _removePhotoPending ||
      _pendingPhotoStaged;

  @override
  void initState() {
    super.initState();
    final auth = ref.read(authProvider);
    _originalName = auth.name.isEmpty ? 'Elif Mashal' : auth.name;
    _originalEmail = auth.email.isEmpty ? 'elif@gmail.com' : auth.email;
    _originalPhone = auth.phone;
    _originalPhotoPath = auth.photoPath;
    _displayPhotoPath = auth.photoPath;

    _nameCtrl = TextEditingController(text: _originalName);
    _emailCtrl = TextEditingController(text: _originalEmail);
    _phoneCtrl = TextEditingController(text: _originalPhone);

    _nameCtrl.addListener(_onFieldChanged);
    _emailCtrl.addListener(_onFieldChanged);
    _phoneCtrl.addListener(_onFieldChanged);
  }

  void _onFieldChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _nameCtrl
      ..removeListener(_onFieldChanged)
      ..dispose();
    _emailCtrl
      ..removeListener(_onFieldChanged)
      ..dispose();
    _phoneCtrl
      ..removeListener(_onFieldChanged)
      ..dispose();
    _nameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    if (_isSaving) return;

    setState(() => _isSaving = true);
    final l10n = context.l10n;

    try {
      final String name = _nameCtrl.text.trim();
      final String email = _emailCtrl.text.trim();
      final String phone = _phoneCtrl.text.trim();

      if (_removePhotoPending) {
        await ref.read(authProvider.notifier).updateProfile(
              name: name,
              email: email,
              phone: phone,
              clearPhoto: true,
            );
        _originalPhotoPath = '';
        _displayPhotoPath = '';
        _removePhotoPending = false;
        _pendingPhotoStaged = false;
      } else if (_pendingPhotoStaged) {
        final String savedPath =
            await ProfilePhotoService.instance.commitPendingPhoto();
        await ref.read(authProvider.notifier).updateProfile(
              name: name,
              email: email,
              phone: phone,
              photoPath: savedPath,
            );
        _originalPhotoPath = savedPath;
        _displayPhotoPath = savedPath;
        _pendingPhotoStaged = false;
      } else {
        await ref.read(authProvider.notifier).updateProfile(
              name: name,
              email: email,
              phone: phone,
              photoPath: _displayPhotoPath.isEmpty ? null : _displayPhotoPath,
            );
        _originalPhotoPath = _displayPhotoPath;
      }

      _originalName = name;
      _originalEmail = email;
      _originalPhone = phone;
      _nameFocus.unfocus();
      _emailFocus.unfocus();
      _phoneFocus.unfocus();

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.preferencesSaved)),
      );
      setState(() {});
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.errorTitle)),
      );
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  Future<void> _pickProfilePhoto() async {
    final bool hasPhoto = _displayPhotoPath.isNotEmpty &&
        File(_displayPhotoPath).existsSync();
    final File? picked = await ImagePickerService.instance.pickProfileImage(
      context,
      allowRemove: hasPhoto,
    );
    if (picked == null || !mounted) return;

    if (picked.path.isEmpty) {
      setState(() {
        _displayPhotoPath = '';
        _removePhotoPending = true;
      });
      return;
    }

    final String savedPath =
        await ProfilePhotoService.instance.stagePhoto(picked);
    if (!mounted) return;
    setState(() {
      _displayPhotoPath = savedPath;
      _removePhotoPending = false;
      _pendingPhotoStaged = true;
    });
  }

  void _cancelChanges() {
    _nameFocus.unfocus();
    _emailFocus.unfocus();
    _phoneFocus.unfocus();
    _nameCtrl.text = _originalName;
    _emailCtrl.text = _originalEmail;
    _phoneCtrl.text = _originalPhone;
    if (_pendingPhotoStaged) {
      unawaited(ProfilePhotoService.instance.discardPendingPhoto());
    }
    _displayPhotoPath = _originalPhotoPath;
    _removePhotoPending = false;
    _pendingPhotoStaged = false;
    setState(() {});
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

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: AppColors.scaffoldColor(context),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 4, 0),
              child: Row(
                children: <Widget>[
                  RtlBackIconButton(
                    onPressed: () => context.pop(),
                    size: 22,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          _titleLeading(l10n.personalInformation),
                          style: AppTextStyles.h3.copyWith(
                            color: _titleBlue,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return AppColors.primaryTwoGradient.createShader(
                              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                            );
                          },
                          blendMode: BlendMode.srcIn,
                          child: Text(
                            _titleAccent(l10n.personalInformation),
                            style: AppTextStyles.h3.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert_rounded,
                      color: _titleBlue,
                      size: 20,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 44,
                      minHeight: 44,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    _ProfilePhotoCard(
                      changePhotoLabel: l10n.tapToChangePhoto,
                      photoPath: _removePhotoPending ? null : _displayPhotoPath,
                      onChangePhoto: _pickProfilePhoto,
                    ),
                    const SizedBox(height: 16),
                    _PersonalInfoField(
                      label: l10n.fullName,
                      controller: _nameCtrl,
                      focusNode: _nameFocus,
                      hintText: 'Elif Mashal',
                      onEdit: () => _nameFocus.requestFocus(),
                    ),
                    const SizedBox(height: 18),
                    _PersonalInfoField(
                      label: l10n.emailAddress,
                      controller: _emailCtrl,
                      focusNode: _emailFocus,
                      hintText: 'elif@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                      onEdit: () => _emailFocus.requestFocus(),
                    ),
                    const SizedBox(height: 18),
                    _PersonalInfoField(
                      label: l10n.phoneNumber,
                      controller: _phoneCtrl,
                      focusNode: _phoneFocus,
                      hintText: '+1 555 000 0000',
                      keyboardType: TextInputType.phone,
                      onEdit: () => _phoneFocus.requestFocus(),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              alignment: Alignment.topCenter,
              child: _hasChanges
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          _SaveChangesButton(
                            label: _isSaving ? l10n.verifying : l10n.saveChanges,
                            onPressed: _isSaving ? null : _saveProfile,
                          ),
                          const SizedBox(height: 12),
                          _CancelButton(
                            label: l10n.cancel,
                            onPressed: _cancelChanges,
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfilePhotoCard extends StatelessWidget {
  const _ProfilePhotoCard({
    required this.changePhotoLabel,
    required this.photoPath,
    required this.onChangePhoto,
  });

  final String changePhotoLabel;
  final String? photoPath;
  final VoidCallback onChangePhoto;

  static const Color _cardFill = Color(0xFFEEEDFD);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 13, 16, 15),
      decoration: BoxDecoration(
        color: _cardFill,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: <Widget>[
          ProfileAvatar(
            photoPath: photoPath,
            size: 80,
            onTap: onChangePhoto,
            showCameraBadge: true,
          ),
          const SizedBox(height: 9),
          GestureDetector(
            onTap: onChangePhoto,
            child: Text(
              changePhotoLabel,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textMuted(context),
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PersonalInfoField extends StatelessWidget {
  const _PersonalInfoField({
    required this.label,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    required this.onEdit,
    this.keyboardType = TextInputType.text,
  });

  static const Color _titleBlue = Color(0xFF022088);

  final String label;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final VoidCallback onEdit;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: AppTextStyles.h4.copyWith(
            color: _titleBlue,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
        color: AppColors.cardColor(context),
            borderRadius: BorderRadius.circular(12),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.16),
                blurRadius: 2,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          padding: const EdgeInsets.fromLTRB(12, 4, 8, 4),
          child: Row(
            children: <Widget>[
              Image.asset(
                Assets.iconsAiPersonal,
                width: 24,
                height: 24,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return AppColors.primaryTwoGradient.createShader(bounds);
                  },
                  blendMode: BlendMode.srcIn,
                  child: const Icon(
                    Icons.person_outline_rounded,
                    size: 22,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  keyboardType: keyboardType,
                  textInputAction: TextInputAction.next,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textMuted(context),
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textMuted(context),
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
              IconButton(
                onPressed: onEdit,
                icon: Icon(
                  Icons.edit_outlined,
                  size: 24,
                  color: AppColors.textMuted(context).withValues(alpha: 0.85),
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(
                  minWidth: 36,
                  minHeight: 36,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SaveChangesButton extends StatelessWidget {
  const _SaveChangesButton({required this.label, this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Opacity(
          opacity: onPressed == null ? 0.65 : 1,
          child: Ink(
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: AppColors.primaryTwoGradient,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  label,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.save_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CancelButton extends StatelessWidget {
  const _CancelButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  static const Color _cancelFill = Color(0xFFEEEDFD);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          height: 54,
          decoration: BoxDecoration(
            color: _cancelFill,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return AppColors.primaryTwoGradient.createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                );
              },
              blendMode: BlendMode.srcIn,
              child: Text(
                label,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
