// ignore_for_file: unused_element

import 'dart:developer';
import 'dart:io';

import 'package:cotton_plant/widgets/error_dialog.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerService {
  static final picker = ImagePicker();
  static Future<File?> getImageFromGallery() async {
    try {
      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        return File(pickedFile.path);
      } else {
        return null;
      }
    } on PlatformException catch (e) {
      log(e.toString());
      showErrorDialog(e.toString());
      return null;
    }
  }

  static Future<File?> getImageFromCamera() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        return File(pickedFile.path);
      } else {
        return null;
      }
    } on PlatformException catch (e) {
      log(e.toString());
      showErrorDialog(e.toString());

      return null;
    }
  }

  static Future<bool> _checkAndRequestGalleryPermission() async {
    PermissionStatus permission = await Permission.storage.status;
    if (permission != PermissionStatus.granted) {
      Map<Permission, PermissionStatus> permissions = await [
        Permission.storage,
      ].request();
      return permissions[Permission.storage] == PermissionStatus.granted;
    } else {
      return true;
    }
  }
}
