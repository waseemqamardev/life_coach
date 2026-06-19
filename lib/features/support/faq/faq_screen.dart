import 'package:flutter/material.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_screen.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  String _topic = 'All';
  String _query = '';

  List<({String topic, String q, String a})> _faqs(AppLocalizations l10n) =>
      <({String topic, String q, String a})>[
        (topic: l10n.topicGettingStarted, q: l10n.faqQ1, a: l10n.faqA1),
        (topic: l10n.topicGettingStarted, q: l10n.faqQ2, a: l10n.faqA2),
        (topic: l10n.topicAi, q: l10n.faqQ3, a: l10n.faqA3),
        (topic: l10n.topicAi, q: l10n.faqQ4, a: l10n.faqA4),
        (topic: l10n.topicBilling, q: l10n.faqQ5, a: l10n.faqA5),
        (topic: l10n.topicBilling, q: l10n.faqQ6, a: l10n.faqA6),
        (topic: l10n.topicAccount, q: l10n.faqQ7, a: l10n.faqA7),
        (topic: l10n.topicAccount, q: l10n.faqQ8, a: l10n.faqA8),
      ];

  List<({String id, String label})> _topics(AppLocalizations l10n) =>
      <({String id, String label})>[
        (id: 'All', label: l10n.topicAll),
        (id: l10n.topicGettingStarted, label: l10n.topicGettingStarted),
        (id: l10n.topicAi, label: l10n.topicAi),
        (id: l10n.topicBilling, label: l10n.topicBilling),
        (id: l10n.topicAccount, label: l10n.topicAccount),
      ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final List<({String topic, String q, String a})> faqs = _faqs(l10n);
    final List<({String topic, String q, String a})> filtered =
        faqs.where((f) {
      final bool topicOk = _topic == 'All' || f.topic == _topic;
      final bool queryOk = _query.isEmpty ||
          f.q.toLowerCase().contains(_query.toLowerCase()) ||
          f.a.toLowerCase().contains(_query.toLowerCase());
      return topicOk && queryOk;
    }).toList();

    return AppScreen(
      titleLeading: l10n.faq,
      titleAccent: '',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            onChanged: (String v) => setState(() => _query = v),
            decoration: InputDecoration(
              hintText: l10n.faqSearchHint,
              prefixIcon: const Icon(Icons.search_rounded),
            ),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _topics(l10n).map((({String id, String label}) t) {
                final bool selected = _topic == t.id;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () => setState(() => _topic = t.id),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: selected
                            ? AppColors.primaryPurple
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: selected
                                ? AppColors.primaryPurple
                                : AppColors.borderColor(context)),
                      ),
                      child: Text(t.label,
                          style: AppTextStyles.bodySmall.copyWith(
                              color: selected
                                  ? Colors.white
                                  : AppColors.textPrimary(context),
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 14),
          if (filtered.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.search_off_rounded,
                        size: 56, color: AppColors.textMuted(context)),
                    const SizedBox(height: 8),
                    Text(l10n.noResults,
                        style: AppTextStyles.h4.copyWith(
                            color: AppColors.textSecondary(context))),
                  ],
                ),
              ),
            )
          else
            for (final f in filtered)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: AppCard(
                  padding: EdgeInsets.zero,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      tilePadding: const EdgeInsets.symmetric(horizontal: 14),
                      childrenPadding:
                          const EdgeInsets.fromLTRB(14, 0, 14, 14),
                      title: Text(f.q,
                          style: AppTextStyles.h4.copyWith(
                              color: AppColors.textPrimary(context),
                              fontSize: 14)),
                      iconColor: AppColors.primaryPurple,
                      collapsedIconColor: AppColors.textMuted(context),
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(f.a,
                              style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.textSecondary(context),
                                  height: 1.5)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
