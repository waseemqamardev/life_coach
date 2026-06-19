import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../../providers/providers.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/gradient_button.dart';
import '../../../shared/widgets/score_gauge.dart';
import '../../../shared/widgets/widgets.dart';

class ReportExportScreen extends ConsumerStatefulWidget {
  const ReportExportScreen({super.key});

  @override
  ConsumerState<ReportExportScreen> createState() => _ReportExportScreenState();
}

class _ReportExportScreenState extends ConsumerState<ReportExportScreen> {
  static const List<String> _includeIds = <String>[
    'executiveSummary',
    'scoreBreakdown',
    'analysisDetails',
    'prosCons',
    'actionPlan',
    'notesAndInputs',
  ];

  final Map<String, bool> _include = <String, bool>{
    'executiveSummary': true,
    'scoreBreakdown': true,
    'analysisDetails': true,
    'prosCons': true,
    'actionPlan': true,
    'notesAndInputs': true,
  };
  String _format = 'PDF';

  String _includeLabel(AppLocalizations l10n, String id) {
    switch (id) {
      case 'executiveSummary':
        return l10n.executiveSummary;
      case 'scoreBreakdown':
        return l10n.scoreBreakdown;
      case 'analysisDetails':
        return l10n.analysisDetails;
      case 'prosCons':
        return l10n.prosCons;
      case 'actionPlan':
        return l10n.actionPlan;
      case 'notesAndInputs':
        return l10n.notesAndInputs;
      default:
        return id;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final d = ref.watch(draftDecisionProvider);
    return AppScreen(
      titleLeading: l10n.reportExportLeading,
      titleAccent: l10n.reportExportAccent,
      subtitle: l10n.reportExportSubtitle,
      trailing: IconButton(
        icon:
            const Icon(Icons.description_outlined, color: AppColors.primaryPurple),
        onPressed: () {},
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppCard(
            child: Row(
              children: <Widget>[
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(14)),
                  child: const Icon(Icons.description_outlined,
                      color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(d?.title ?? 'Career Change Decision',
                          style: AppTextStyles.h4.copyWith(
                              color: AppColors.textPrimary(context))),
                      const SizedBox(height: 2),
                      Text(
                          'Should you transition to a Product Manager role?',
                          style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary(context))),
                      const SizedBox(height: 4),
                      Text('May 12, 2025 • 10:30 AM',
                          style: AppTextStyles.caption.copyWith(
                              color: AppColors.textMuted(context))),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      color: AppColors.success.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Icon(Icons.check_circle_rounded,
                          color: AppColors.success, size: 14),
                      const SizedBox(width: 4),
                      Text(l10n.completed,
                          style: AppTextStyles.caption.copyWith(
                              color: AppColors.success,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
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
                      ScoreGauge(value: d?.overallScore ?? 84, size: 100),
                      const SizedBox(height: 6),
                      Text(l10n.overallScore,
                          style: AppTextStyles.caption.copyWith(
                              color: AppColors.textSecondary(context))),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      const Icon(Icons.verified_user_outlined,
                          color: AppColors.success, size: 28),
                      const SizedBox(height: 4),
                      Text(l10n.goAhead,
                          style: AppTextStyles.h4.copyWith(
                              color: AppColors.success, fontSize: 14)),
                      const SizedBox(height: 4),
                      Text(l10n.recommendedChoiceLabel,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.caption.copyWith(
                              color: AppColors.textSecondary(context))),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      const Icon(Icons.shield_outlined,
                          color: AppColors.danger, size: 28),
                      const SizedBox(height: 4),
                      Text(l10n.low,
                          style: AppTextStyles.h4.copyWith(
                              color: AppColors.danger, fontSize: 14)),
                      const SizedBox(height: 4),
                      Text(l10n.riskLevel,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.caption.copyWith(
                              color: AppColors.textSecondary(context))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(l10n.includeInReport,
                    style: AppTextStyles.h4
                        .copyWith(color: AppColors.textPrimary(context))),
                const SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _includeIds.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2.5,
                  ),
                  itemBuilder: (BuildContext c, int i) {
                    final String id = _includeIds[i];
                    final bool checked = _include[id]!;
                    return GestureDetector(
                      onTap: () =>
                          setState(() => _include[id] = !checked),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 22,
                            height: 22,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: checked
                                  ? AppColors.primaryPurple
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: checked
                                    ? AppColors.primaryPurple
                                    : AppColors.borderColor(c),
                                width: 2,
                              ),
                            ),
                            child: checked
                                ? const Icon(Icons.check_rounded,
                                    color: Colors.white, size: 14)
                                : null,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(_includeLabel(l10n, id),
                                style: AppTextStyles.bodySmall.copyWith(
                                    color: AppColors.textPrimary(c),
                                    fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(l10n.exportFormat,
                    style: AppTextStyles.h4
                        .copyWith(color: AppColors.textPrimary(context))),
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    for (final ({String name, IconData icon, Color color, String sub}) f
                        in <({String name, IconData icon, Color color, String sub})>[
                      (name: 'PDF', icon: Icons.picture_as_pdf_rounded, color: AppColors.danger, sub: l10n.pdfBestForSharing),
                      (name: 'Excel', icon: Icons.table_chart_rounded, color: AppColors.success, sub: l10n.excelDataScores),
                      (name: 'Word', icon: Icons.description_rounded, color: AppColors.info, sub: l10n.wordDocument),
                      (name: 'Image', icon: Icons.image_outlined, color: AppColors.primaryPurple, sub: l10n.imageJpgPng),
                    ])
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: GestureDetector(
                            onTap: () => setState(() => _format = f.name),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: _format == f.name
                                    ? AppColors.softPrimary(context)
                                    : Colors.transparent,
                                border: Border.all(
                                    color: _format == f.name
                                        ? AppColors.primaryPurple
                                        : AppColors.borderColor(context)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Icon(f.icon, color: f.color, size: 22),
                                  const SizedBox(height: 4),
                                  Text(f.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.bodySmall.copyWith(
                                          color:
                                              AppColors.textPrimary(context),
                                          fontWeight: FontWeight.w700)),
                                  Text(f.sub,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.caption.copyWith(
                                          color: AppColors.textMuted(context))),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(l10n.shareOrSave,
                    style: AppTextStyles.h4
                        .copyWith(color: AppColors.textPrimary(context))),
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    _shareTile(context, Icons.link_rounded, l10n.shareLink,
                        l10n.createShareableLink),
                    const SizedBox(width: 8),
                    _shareTile(context, Icons.mail_outline_rounded,
                        l10n.emailReport, l10n.sendViaEmail),
                    const SizedBox(width: 8),
                    _shareTile(context, Icons.file_download_outlined,
                        l10n.saveToDevice, l10n.downloadToDevice),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          GradientButton(
              label: l10n.exportReport,
              icon: Icons.file_download_outlined,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.exportedAs(_format))));
              }),
          const SizedBox(height: 10),
          OutlineSecondaryButton(
              label: l10n.scheduleAutoReports,
              icon: Icons.schedule_rounded,
              onPressed: () {}),
          const SizedBox(height: 12),
          const SecureFooter(),
        ],
      ),
    );
  }

  Widget _shareTile(BuildContext c, IconData icon, String title, String sub) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor(c)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(icon, color: AppColors.primaryPurple),
            const SizedBox(height: 6),
            Text(title,
                style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textPrimary(c),
                    fontWeight: FontWeight.w600)),
            Text(sub,
                style: AppTextStyles.caption
                    .copyWith(color: AppColors.textMuted(c))),
          ],
        ),
      ),
    );
  }
}
