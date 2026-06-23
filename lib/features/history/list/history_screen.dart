import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../shared/widgets/exit_alert_dialog.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/decision.dart';
import '../../../generated/assets.dart';
import '../../../shared/widgets/rtl_aware.dart';
import '../../../l10n/app_localizations.dart';
import '../../../providers/providers.dart';
import '../../../shared/widgets/bottom_nav.dart';
import '../../../shared/widgets/selection_check_circle.dart';
import '../../results/shared/result_ui_widgets.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key, this.navIndex = 3});

  final int navIndex;

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  DateTime? _lastPressedAt;
  static const Color _scoreGreen = Color(0xFF16A34A);

  final TextEditingController _searchCtrl = TextEditingController();
  final Set<String> _selectedIds = <String>{};
  bool _selectionMode = false;

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  List<Decision> _filtered(List<Decision> all) {
    final String query = _searchCtrl.text.trim().toLowerCase();
    if (query.isEmpty) return all;
    return all
        .where((Decision d) => d.title.toLowerCase().contains(query))
        .toList();
  }

  void _exitSelectionMode() {
    setState(() {
      _selectionMode = false;
      _selectedIds.clear();
    });
  }

  void _selectAll(List<Decision> items) {
    setState(() {
      _selectionMode = true;
      _selectedIds
        ..clear()
        ..addAll(items.map((Decision d) => d.id));
    });
  }

  void _deselectAll() {
    setState(() {
      _selectedIds.clear();
      _selectionMode = false;
    });
  }

  Future<void> _deleteSelected(AppLocalizations l10n) async {
    if (_selectedIds.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.selectDecisionsToDelete)),
      );
      return;
    }
    final DecisionsNotifier notifier = ref.read(decisionsProvider.notifier);
    for (final String id in _selectedIds.toList()) {
      await notifier.remove(id);
    }
    if (mounted) _exitSelectionMode();
  }

  void _openCompare(AppLocalizations l10n) {
    if (_selectedIds.length != 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.selectOneDecisionToCompare)),
      );
      return;
    }

    ref.read(compareSelectionProvider.notifier).setSelection(_selectedIds);
    context.push(AppRoutes.compareDecisions);
  }

  void _toggleSelection(Decision decision) {
    setState(() {
      if (_selectedIds.contains(decision.id)) {
        _selectedIds.remove(decision.id);
        if (_selectedIds.isEmpty) {
          _selectionMode = false;
        }
        return;
      }

      _selectedIds.add(decision.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final List<Decision> all = ref.watch(decisionsProvider);
    final List<Decision> filtered = _filtered(all);
    final int highScoreCount =
        all.where((Decision d) => d.overallScore >= 80).length;
    final int lowRiskCount =
        all.where((Decision d) => d.riskScore <= 35).length;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) return;
        final DateTime now = DateTime.now();
        if (_lastPressedAt == null ||
            now.difference(_lastPressedAt!) > const Duration(seconds: 2)) {
          _lastPressedAt = now;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.pressBackAgainToExit),
              duration: const Duration(seconds: 2),
            ),
          );
          return;
        }
        final bool shouldExit = await showExitAlertDialog(context);
        if (shouldExit) {
          await SystemNavigator.pop();
        }
      },
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.scaffoldColor(context),
        bottomNavigationBar: AppBottomNav.forScaffold(
          context,
          currentIndex: widget.navIndex,
        ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 4, 0),
              child: Row(
                children: <Widget>[
                  // RtlBackIconButton(
                  //   onPressed: () {
                  //     if (_selectionMode) {
                  //       _exitSelectionMode();
                  //     } else {
                  //       context.pop();
                  //     }
                  //   },
                  //   size: 22,
                  // ),
                  Expanded(
                    child: Text(
                      l10n.history,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.h3.copyWith(
                        color: AppColors.appBarAccentColor(context),
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  PopupMenuButton<String>(
                    offset: const Offset(0, 42),
                    icon: Icon(
                      Icons.more_vert_rounded,
                      color: AppColors.appBarIconColor(context),
                      size: 22,
                    ),
                    color: AppColors.cardColor(context),
                    elevation: 10,
                    shadowColor: Colors.black.withValues(alpha: 0.14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    onSelected: (String value) {
                      switch (value) {
                        case 'comparison':
                          _openCompare(l10n);
                        case 'select_all':
                          _selectAll(filtered);
                        case 'deselect_all':
                          _deselectAll();
                        case 'delete':
                          _deleteSelected(l10n);
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'comparison',
                        height: 46,
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              Assets.iconsAiComparison,
                              width: 16,
                              height: 16,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              l10n.comparisonWord,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.textPrimary(context),
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const PopupMenuDivider(
                        height: 1,
                        indent: 16,
                        endIndent: 16,
                      ),
                      PopupMenuItem<String>(
                        value: 'select_all',
                        height: 46,
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              Assets.iconsAiSelect,
                              width: 16,
                              height: 16,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              l10n.selectAll,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.textPrimary(context),
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (_selectedIds.isNotEmpty)
                        PopupMenuItem<String>(
                          value: 'deselect_all',
                          height: 46,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.deselect_outlined,
                                size: 16,
                                color: AppColors.textPrimary(context),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                l10n.deselectAll,
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.textPrimary(context),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      const PopupMenuDivider(
                        height: 1,
                        indent: 16,
                        endIndent: 16,
                      ),
                      PopupMenuItem<String>(
                        value: 'delete',
                        height: 46,
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              Assets.iconsAiDelete,
                              width: 16,
                              height: 16,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              l10n.delete,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.textPrimary(context),
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: _HistoryStatCard(
                        iconAsset: Assets.iconsHistory,
                        iconBg: AppColors.primaryPurple.withValues(alpha: 0.16),
                        label: l10n.total,
                        value: '${all.length}',
                        valueColor: AppColors.primaryPurple,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _HistoryStatCard(
                        iconAsset: Assets.iconsMediumScore,
                        iconBg: AppColors.softSuccess(context),
                        label: l10n.highScore,
                        value: '$highScoreCount',
                        valueColor: _scoreGreen,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _HistoryStatCard(
                        iconAsset: Assets.iconsRiskIconScore,
                        iconBg: AppColors.softDanger(context),
                        label: l10n.lowRisk,
                        value: '$lowRiskCount',
                        valueColor: AppColors.danger,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 46,
                child: TextField(
                  controller: _searchCtrl,
                  onChanged: (_) => setState(() {}),
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textPrimary(context),
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                  decoration: InputDecoration(
                    hintText: l10n.searchHint,
                    hintStyle: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textMuted(context),
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Icon(
                        Icons.search_rounded,
                        color: AppColors.textMuted(context)
                            .withValues(alpha: 0.75),
                        size: 20,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 40,
                      minHeight: 20,
                    ),
                    filled: true,
                    fillColor: AppColors.cardColor(context),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColors.borderColor(context)
                            .withValues(alpha: 0.9),
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
                        color: AppColors.borderColor(context)
                            .withValues(alpha: 0.9),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: filtered.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.history_rounded,
                            size: 56,
                            color: AppColors.textMuted(context)
                                .withValues(alpha: 0.6),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            l10n.emptyHistory,
                            style: AppTextStyles.h4.copyWith(
                              color: AppColors.textSecondary(context),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            l10n.startFirstDecision,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textMuted(context),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.fromLTRB(
                        20,
                        0,
                        20,
                        AppBottomNav.contentBottomPadding(context),
                      ),
                      itemCount: filtered.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (BuildContext context, int index) {
                        final Decision decision = filtered[index];
                        final bool selected =
                            _selectedIds.contains(decision.id);

                        return _HistoryDecisionCard(
                          decision: decision,
                          selected: selected,
                          selectionMode: _selectionMode,
                          onTap: () {
                            if (_selectionMode) {
                              _toggleSelection(decision);
                              return;
                            }
                            ref
                                .read(draftDecisionProvider.notifier)
                                .start(decision);
                            context.push(AppRoutes.decisionResult);
                          },
                          onLongPress: () {
                            setState(() {
                              _selectionMode = true;
                              _selectedIds
                                ..clear()
                                ..add(decision.id);
                            });
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    ),);
  }
}

class _HistoryStatCard extends StatelessWidget {
  const _HistoryStatCard({
    required this.iconAsset,
    required this.iconBg,
    required this.label,
    required this.value,
    required this.valueColor,
  });

  final String iconAsset;
  final Color iconBg;
  final String label;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    final bool isDark = !AppColors.isLight(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.homeCardColor(context),
        borderRadius: BorderRadius.circular(12),
        border:
            isDark ? Border.all(color: AppColors.borderColor(context)) : null,
        boxShadow: AppColors.homeStatCardShadow(context),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              iconAsset,
              width: 18,
              height: 18,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textMuted(context),
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            textAlign: TextAlign.center,
            style: AppTextStyles.h3.copyWith(
              color: valueColor,
              fontWeight: FontWeight.w700,
              fontSize: 24,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _HistoryDecisionCard extends StatelessWidget {
  const _HistoryDecisionCard({
    required this.decision,
    required this.selected,
    required this.selectionMode,
    required this.onTap,
    required this.onLongPress,
  });

  final Decision decision;
  final bool selected;
  final bool selectionMode;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  static const Color _scoreGreen = Color(0xFF16A34A);

  @override
  Widget build(BuildContext context) {
    final bool isDark = !AppColors.isLight(context);
    final int score = decision.overallScore == 0 ? 80 : decision.overallScore;
    final String riskLabel = decision.riskLabel;
    final Color riskText = _riskTextColor(decision.riskScore);
    final Color riskBg = _riskBackgroundColor(context, decision.riskScore);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: selectionMode && selected
                ? AppColors.selectedFillColor(context)
                : AppColors.homeCardColor(context),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.borderColor(context).withValues(
                alpha: isDark ? 1 : 0.85,
              ),
            ),
            boxShadow: isDark
                ? AppColors.homeCardShadow(context)
                : ResultUi.cardShadow(context),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                Assets.imagesPurpleBulb,
                width: 44,
                height: 44,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      decision.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.h4.copyWith(
                        color: AppColors.accentTitleColor(context),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${DateFormat('MMMM d, yyyy').format(decision.createdAt)} | ${context.l10n.relativeTime(decision.createdAt)}',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textMuted(context),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        _HistoryBadge(
                          label: context.l10n.scoreLabel(score),
                          textColor: _scoreGreen,
                          backgroundColor: AppColors.softSuccess(context),
                        ),
                        const SizedBox(width: 6),
                        _HistoryBadge(
                          label: riskLabel,
                          textColor: riskText,
                          backgroundColor: riskBg,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              if (selectionMode)
                SelectionCheckCircle(
                  selected: selected,
                  size: 20,
                  checkSize: 12,
                )
              else
                RtlChevronIcon(
                  color: AppColors.textMuted(context).withValues(alpha: 0.7),
                  size: 22,
                ),
            ],
          ),
        ),
      ),
    );
  }

  static Color _riskTextColor(int riskScore) {
    if (riskScore <= 35) return AppColors.warning;
    if (riskScore <= 65) return AppColors.warning;
    return AppColors.danger;
  }

  static Color _riskBackgroundColor(BuildContext context, int riskScore) {
    if (riskScore <= 35) return AppColors.softWarning(context);
    if (riskScore <= 65) return AppColors.softWarning(context);
    return AppColors.softDanger(context);
  }
}

class _HistoryBadge extends StatelessWidget {
  const _HistoryBadge({
    required this.label,
    required this.textColor,
    required this.backgroundColor,
  });

  final String label;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        label,
        style: AppTextStyles.bodySmall.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}
