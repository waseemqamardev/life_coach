import 'package:flutter/material.dart';

import '../constants/supported_languages.dart';
import '../theme/app_colors.dart';

extension RtlContext on BuildContext {
  bool get isRtl => Directionality.of(this) == TextDirection.rtl;

  TextDirection get textDirection => Directionality.of(this);

  TextAlign get textAlignStart => TextAlign.start;

  TextAlign get textAlignEnd => TextAlign.end;

  CrossAxisAlignment get crossAxisStart => CrossAxisAlignment.start;

  CrossAxisAlignment get crossAxisEnd => CrossAxisAlignment.end;

  Alignment get gradientStart =>
      isRtl ? Alignment.centerRight : Alignment.centerLeft;

  Alignment get gradientEnd =>
      isRtl ? Alignment.centerLeft : Alignment.centerRight;

  AlignmentDirectional get alignmentStart => AlignmentDirectional.centerStart;

  AlignmentDirectional get alignmentEnd => AlignmentDirectional.centerEnd;

  EdgeInsetsDirectional get screenPadding =>
      const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 8);

  EdgeInsetsDirectional get headerBackPadding =>
      const EdgeInsetsDirectional.fromSTEB(8, 4, 4, 0);
}

/// Applies RTL/LTR layout for a subtree (e.g. language picker preview).
class RtlLayout extends StatelessWidget {
  const RtlLayout({
    super.key,
    required this.rtl,
    required this.child,
  });

  final bool rtl;
  final Widget child;

  factory RtlLayout.fromLanguageId({
    required String languageId,
    required Widget child,
  }) {
    final SupportedLanguage? lang = SupportedLanguage.byId(languageId);
    return RtlLayout(
      rtl: lang?.rtl ?? false,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
      child: child,
    );
  }
}

/// Mirrors a widget horizontally when the active layout direction is RTL.
class RtlMirror extends StatelessWidget {
  const RtlMirror({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!context.isRtl) return child;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..scaleByDouble(-1.0, 1.0, 1.0, 1.0),
      child: child,
    );
  }
}

/// Circular radio indicator for language rows and option cards.
class RtlRadioIndicator extends StatelessWidget {
  const RtlRadioIndicator({
    super.key,
    required this.selected,
    required this.accentColor,
    this.selectedInnerColor,
    this.selectedRingColor = Colors.white,
  });

  final bool selected;
  final Color accentColor;
  final Color? selectedInnerColor;
  final Color selectedRingColor;

  @override
  Widget build(BuildContext context) {
    if (selected) {
      return Container(
        width: 22,
        height: 22,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: selectedRingColor, width: 2),
        ),
        child: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: selectedInnerColor ?? AppColors.cardColor(context),
            shape: BoxShape.circle,
          ),
        ),
      );
    }

    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: accentColor, width: 2),
      ),
    );
  }
}
