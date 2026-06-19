import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../providers/providers.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/gradient_button.dart';
import '../../../shared/widgets/widgets.dart';

class SaveDecisionScreen extends ConsumerStatefulWidget {
  const SaveDecisionScreen({super.key});

  @override
  ConsumerState<SaveDecisionScreen> createState() => _SaveDecisionScreenState();
}

class _SaveDecisionScreenState extends ConsumerState<SaveDecisionScreen> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _notes = TextEditingController();
  String _folder = 'Default';

  @override
  void initState() {
    super.initState();
    final d = ref.read(draftDecisionProvider);
    if (d != null) _title.text = d.title;
  }

  @override
  void dispose() {
    _title.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final d = ref.read(draftDecisionProvider);
    if (d == null) return;
    d
      ..title = _title.text.trim().isEmpty ? d.title : _title.text.trim()
      ..notes = _notes.text.trim()
      ..folder = _folder;
    try {
      await ref.read(decisionsProvider.notifier).save(d);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.errorSubtitle)),
      );
      return;
    }
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.decisionSaved)));
      context.go(AppRoutes.history);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppScreen(
      titleLeading: l10n.saveDecisionLeading,
      titleAccent: l10n.saveDecisionAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(l10n.fieldTitle,
              style: AppTextStyles.label
                  .copyWith(color: AppColors.textPrimary(context))),
          const SizedBox(height: 6),
          TextField(
            controller: _title,
            decoration: InputDecoration(hintText: l10n.fieldTitle),
          ),
          const SizedBox(height: 12),
          Text(l10n.folderLabel,
              style: AppTextStyles.label
                  .copyWith(color: AppColors.textPrimary(context))),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            value: _folder,
            items: <DropdownMenuItem<String>>[
              DropdownMenuItem<String>(value: 'Default', child: Text(l10n.folderDefault)),
              DropdownMenuItem<String>(value: 'Career', child: Text(l10n.folderCareer)),
              DropdownMenuItem<String>(value: 'Finance', child: Text(l10n.folderFinance)),
              DropdownMenuItem<String>(value: 'Health', child: Text(l10n.folderHealth)),
              DropdownMenuItem<String>(value: 'Personal', child: Text(l10n.folderPersonal)),
            ],
            onChanged: (String? v) => setState(() => _folder = v ?? 'Default'),
            decoration: const InputDecoration(),
          ),
          const SizedBox(height: 12),
          Text(l10n.notes,
              style: AppTextStyles.label
                  .copyWith(color: AppColors.textPrimary(context))),
          const SizedBox(height: 6),
          TextField(
            controller: _notes,
            maxLines: 4,
            decoration: InputDecoration(
                hintText: l10n.saveDecisionNotesHint),
          ),
          const SizedBox(height: 20),
          GradientButton(label: l10n.saveButton, icon: Icons.bookmark_added_outlined, onPressed: _save),
          const SizedBox(height: 12),
          const SecureFooter(),
        ],
      ),
    );
  }
}
