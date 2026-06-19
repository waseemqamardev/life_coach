import 'package:flutter/material.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/gradient_button.dart';

class PersonalityScreen extends StatefulWidget {
  const PersonalityScreen({super.key});

  @override
  State<PersonalityScreen> createState() => _PersonalityScreenState();
}

class _PersonalityScreenState extends State<PersonalityScreen> {
  static String _titleLeading(String title) {
    final int space = title.lastIndexOf(' ');
    if (space < 0) return title;
    return title.substring(0, space);
  }

  static String _titleAccent(String title) {
    final int space = title.lastIndexOf(' ');
    if (space < 0) return '';
    return title.substring(space + 1);
  }

  Map<String, double>? _traits;
  Set<String>? _focus;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    _traits ??= <String, double>{
      l10n.riskTolerance: 0.6,
      l10n.traitOptimism: 0.7,
      l10n.traitPatience: 0.5,
      l10n.traitDetailFocus: 0.65,
    };
    _focus ??= <String>{l10n.categoryCareer, l10n.categoryFinance};

    final Map<String, double> traits = _traits!;
    final Set<String> focus = _focus!;

    final List<String> focusOptions = <String>[
      l10n.categoryCareer,
      l10n.categoryFinance,
      l10n.categoryHealth,
      l10n.categoryRelations,
      l10n.categoryEducation,
      l10n.categoryTravel,
    ];

    return AppScreen(
      titleLeading: _titleLeading(l10n.personalityPreferences),
      titleAccent: _titleAccent(l10n.personalityPreferences),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(l10n.personalitySubtitle,
              style: AppTextStyles.h3
                  .copyWith(color: AppColors.textPrimary(context))),
          const SizedBox(height: 6),
          Text(l10n.personalityDescription,
              style: AppTextStyles.bodySmall
                  .copyWith(color: AppColors.textSecondary(context))),
          const SizedBox(height: 18),
          AppCard(
            child: Column(
              children: <Widget>[
                for (final String t in traits.keys)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(t,
                                style: AppTextStyles.h4.copyWith(
                                    color: AppColors.textPrimary(context),
                                    fontSize: 14)),
                            Text('${(traits[t]! * 100).round()}%',
                                style: AppTextStyles.caption.copyWith(
                                    color: AppColors.primaryPurple,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                        Slider(
                          value: traits[t]!,
                          onChanged: (double v) =>
                              setState(() => traits[t] = v),
                          activeColor: AppColors.primaryPurple,
                          inactiveColor: AppColors.borderColor(context),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Text(l10n.focusAreas,
              style: AppTextStyles.h4
                  .copyWith(color: AppColors.textPrimary(context))),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: focusOptions.map((String f) {
              final bool selected = focus.contains(f);
              return GestureDetector(
                onTap: () => setState(() {
                  selected ? focus.remove(f) : focus.add(f);
                }),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: selected
                        ? AppColors.softPrimary(context)
                        : Colors.transparent,
                    border: Border.all(
                        color: selected
                            ? AppColors.primaryPurple
                            : AppColors.borderColor(context)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(f,
                      style: AppTextStyles.bodySmall.copyWith(
                          color: selected
                              ? AppColors.primaryPurple
                              : AppColors.textPrimary(context),
                          fontWeight: FontWeight.w600)),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 22),
          GradientButton(
            label: l10n.savePreferences,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(l10n.preferencesSaved),
              ));
            },
          ),
        ],
      ),
    );
  }
}
