import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/decision.dart';
import '../../../providers/providers.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/score_gauge.dart';

class DecisionDetailScreen extends ConsumerWidget {
  const DecisionDetailScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final Decision? d = ref.read(decisionsProvider.notifier).get(id);

    if (d == null) {
      return AppScreen(
        titleLeading: l10n.decisionDetailLeading,
        titleAccent: l10n.detailWord,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 80),
            Icon(Icons.error_outline_rounded,
                size: 48, color: AppColors.textMuted(context)),
            const SizedBox(height: 12),
            Text(l10n.decisionNotFound,
                style: AppTextStyles.h4.copyWith(
                    color: AppColors.textSecondary(context))),
          ],
        ),
      );
    }

    return AppScreen(
      titleLeading: l10n.decisionDetailLeading,
      titleAccent: l10n.detailWord,
      trailing: IconButton(
        icon: Icon(
          Icons.ios_share_rounded,
          color: AppColors.appBarIconColor(context),
        ),
        onPressed: () {},
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(d.title,
                    style: AppTextStyles.h3
                        .copyWith(color: AppColors.textPrimary(context))),
                const SizedBox(height: 4),
                Text(
                    '${d.category} • ${DateFormat.yMMMd().add_jm().format(d.createdAt)}',
                    style: AppTextStyles.caption
                        .copyWith(color: AppColors.textMuted(context))),
                if (d.description.isNotEmpty) ...<Widget>[
                  const SizedBox(height: 12),
                  Text(d.description,
                      style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textSecondary(context))),
                ],
              ],
            ),
          ),
          const SizedBox(height: 14),
          AppCard(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      ScoreGauge(value: d.overallScore, size: 100),
                      const SizedBox(height: 4),
                      Text(l10n.overall,
                          style: AppTextStyles.caption.copyWith(
                              color: AppColors.textSecondary(context))),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text('${d.riskScore}',
                          style: AppTextStyles.bigScore
                              .copyWith(color: AppColors.danger, fontSize: 30)),
                      Text(l10n.riskScore,
                          style: AppTextStyles.caption.copyWith(
                              color: AppColors.textSecondary(context))),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text('${d.confidence}%',
                          style: AppTextStyles.bigScore.copyWith(
                              color: AppColors.primaryPurple, fontSize: 30)),
                      Text(l10n.confidence,
                          style: AppTextStyles.caption.copyWith(
                              color: AppColors.textSecondary(context))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          if (d.pros.isNotEmpty) ...<Widget>[
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(l10n.pros,
                      style: AppTextStyles.h4.copyWith(
                          color: AppColors.success)),
                  const SizedBox(height: 8),
                  for (final String p in d.pros)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Icon(Icons.check_circle_rounded,
                              color: AppColors.success, size: 16),
                          const SizedBox(width: 6),
                          Expanded(
                              child: Text(p,
                                  style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.textPrimary(context)))),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(l10n.cons,
                      style: AppTextStyles.h4.copyWith(
                          color: AppColors.danger)),
                  const SizedBox(height: 8),
                  for (final String c in d.cons)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Icon(Icons.remove_circle_outline_rounded,
                              color: AppColors.danger, size: 16),
                          const SizedBox(width: 6),
                          Expanded(
                              child: Text(c,
                                  style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.textPrimary(context)))),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
          if (d.notes.isNotEmpty) ...<Widget>[
            const SizedBox(height: 10),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(l10n.notes,
                      style: AppTextStyles.h4.copyWith(
                          color: AppColors.textPrimary(context))),
                  const SizedBox(height: 6),
                  Text(d.notes,
                      style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textSecondary(context))),
                ],
              ),
            ),
          ],
          const SizedBox(height: 18),
          SizedBox(
            height: 56,
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () async {
                await ref.read(decisionsProvider.notifier).remove(d.id);
                if (context.mounted) context.pop();
              },
              icon: const Icon(Icons.delete_outline_rounded,
                  size: 18, color: AppColors.danger),
              label: Text(l10n.delete,
                  style: AppTextStyles.buttonText
                      .copyWith(color: AppColors.danger)),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.borderColor(context)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
