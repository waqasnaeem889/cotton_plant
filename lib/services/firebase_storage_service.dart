// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:cotton_plant/widgets/error_dialog.dart';
import 'package:cotton_plant/widgets/loading_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageServices {
  static Future<String> uploadToStorage(
      {required File file,
      required String folderName,
      bool showDialog = true}) async {
    showDialog ? showLoadingDialog(message: "Processing...") : null;
    try {
      final Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(
            '$folderName/file${DateTime.now().millisecondsSinceEpoch}',
          );

      final UploadTask uploadTask = firebaseStorageRef.putFile(file);

      final TaskSnapshot downloadUrl = await uploadTask;

      String url = await downloadUrl.ref.getDownloadURL();
      showDialog ? hideLoadingDialog() : null;
      return url;
    } on Exception catch (e) {
      showDialog ? hideLoadingDialog() : null;

      showErrorDialog(e.toString());
      return "";
    }
  }
}

class StorageFolderNames {
  static String userFolder(String uid) => 'Users/$uid';
}
