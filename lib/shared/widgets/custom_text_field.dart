import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

/// Section label with a leading icon asset, used above form fields.
class CustomFormFieldLabel extends StatelessWidget {
  const CustomFormFieldLabel({
    super.key,
    required this.icon,
    required this.label,
    this.iconSize = 24,
  });

  final String icon;
  final String label;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          icon,
          width: iconSize,
          height: iconSize,
          fit: BoxFit.contain,
          color: AppColors.primaryPurple,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: AppTextStyles.h4.copyWith(
            color: AppColors.textPrimary(context),
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

/// Styled text field with optional character counter shown below the field.
///
/// Validation errors use the same [InputDecorationTheme] as auth screens.
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.validator,
    this.showCounter = true,
    this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final int? maxLength;
  final int maxLines;
  final int? minLines;
  final String? Function(String?)? validator;
  final bool showCounter;
  final ValueChanged<String>? onChanged;

  bool get _isMultiline => maxLines > 1;

  InputDecoration _decoration(BuildContext context) {
    final InputDecorationThemeData theme =
        Theme.of(context).inputDecorationTheme;

    return InputDecoration(
      hintText: hintText,
      counterText: showCounter && maxLength != null ? '' : null,
      errorMaxLines: 2,
    ).applyDefaults(theme).copyWith(
      hintStyle: theme.hintStyle?.copyWith(
        fontSize: 12,
        height: _isMultiline ? 1.4 : 1.2,
      ),
      contentPadding: _isMultiline
          ? const EdgeInsets.fromLTRB(16, 14, 16, 14)
          : theme.contentPadding,
    );
  }

  TextStyle _textStyle(BuildContext context) =>
      AppTextStyles.bodySmall.copyWith(
        color: AppColors.textPrimary(context),
        fontSize: 12,
        height: _isMultiline ? 1.45 : 1.2,
      );

  @override
  Widget build(BuildContext context) {
    final Widget field = TextFormField(
      controller: controller,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      validator: validator,
      onChanged: onChanged,
      textAlignVertical:
          _isMultiline ? TextAlignVertical.top : TextAlignVertical.center,
      style: _textStyle(context),
      decoration: _decoration(context),
    );

    if (!showCounter || maxLength == null) {
      return field;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        field,
        ListenableBuilder(
          listenable: controller,
          builder: (BuildContext context, Widget? child) {
            return Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '${controller.text.length}/$maxLength',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textMuted(context),
                    fontSize: 10,
                    height: 1,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

/// Pill-shaped search field used on History and similar list screens.
class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.height = 48,
  });

  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final double height;

  static const Color _borderColor = Color(0xFFE8EAEE);

  @override
  Widget build(BuildContext context) {
    final bool isDark = !AppColors.isLight(context);

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.cardColor(context),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : _borderColor,
          width: 1,
        ),
        boxShadow: AppColors.cardShadowList(context),
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        textAlignVertical: TextAlignVertical.center,
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.textPrimary(context),
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 1.2,
        ),
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textMuted(context),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.2,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 16, right: 6),
            child: Icon(
              Icons.search_rounded,
              size: 20,
              color: AppColors.textMuted(context).withValues(alpha: 0.85),
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          contentPadding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          filled: false,
        ),
      ),
    );
  }
}
