import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../l10n/l10n_extensions.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

enum ProfileImageAction { camera, gallery, remove }

/// Shows a source picker sheet, requests permissions, and returns a picked file.
class ImagePickerService {
  ImagePickerService._();
  static final ImagePickerService instance = ImagePickerService._();

  final ImagePicker _picker = ImagePicker();

  Future<File?> pickProfileImage(
    BuildContext context, {
    bool allowRemove = false,
  }) async {
    final ProfileImageAction? action = await _showProfileImageSheet(
      context,
      allowRemove: allowRemove,
    );
    if (action == null || !context.mounted) return null;
    if (action == ProfileImageAction.remove) {
      return File('');
    }

    final ImageSource source = action == ProfileImageAction.camera
        ? ImageSource.camera
        : ImageSource.gallery;

    final bool granted = await _ensurePermission(context, source);
    if (!granted || !context.mounted) return null;

    final XFile? picked = await _picker.pickImage(
      source: source,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 85,
    );
    if (picked == null) return null;
    return File(picked.path);
  }

  Future<ProfileImageAction?> _showProfileImageSheet(
    BuildContext context, {
    required bool allowRemove,
  }) {
    final l10n = context.l10n;
    return showModalBottomSheet<ProfileImageAction>(
      context: context,
      backgroundColor: AppColors.cardColor(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  l10n.pickImageSourceTitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h4.copyWith(
                    color: AppColors.textPrimary(context),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                ListTile(
                  leading: const Icon(Icons.photo_camera_outlined),
                  title: Text(l10n.pickFromCamera),
                  onTap: () => Navigator.of(sheetContext)
                      .pop(ProfileImageAction.camera),
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library_outlined),
                  title: Text(l10n.pickFromGallery),
                  onTap: () => Navigator.of(sheetContext)
                      .pop(ProfileImageAction.gallery),
                ),
                if (allowRemove)
                  ListTile(
                    leading: const Icon(Icons.delete_outline_rounded),
                    title: Text(l10n.removePhoto),
                    onTap: () => Navigator.of(sheetContext)
                        .pop(ProfileImageAction.remove),
                  ),
                ListTile(
                  leading: const Icon(Icons.close_rounded),
                  title: Text(l10n.cancel),
                  onTap: () => Navigator.of(sheetContext).pop(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<bool> _ensurePermission(
    BuildContext context,
    ImageSource source,
  ) async {
    final Permission permission = source == ImageSource.camera
        ? Permission.camera
        : Permission.photos;

    PermissionStatus status = await permission.status;
    if (status.isGranted || status.isLimited) return true;

    status = await permission.request();
    if (status.isGranted || status.isLimited) return true;

    if (!context.mounted) return false;

    final String message = source == ImageSource.camera
        ? context.l10n.cameraPermissionDenied
        : context.l10n.galleryPermissionDenied;

    if (status.isPermanentlyDenied) {
      await _showPermissionDialog(context, message);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
    return false;
  }

  Future<void> _showPermissionDialog(
    BuildContext context,
    String message,
  ) async {
    final l10n = context.l10n;
    await showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(l10n.permissionTitle),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(l10n.cancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                openAppSettings();
              },
              child: Text(l10n.openSettings),
            ),
          ],
        );
      },
    );
  }
}
