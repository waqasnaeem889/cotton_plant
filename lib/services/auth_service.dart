import 'dart:async';

import 'package:cotton_plant/controller/auth_controller.dart';
import 'package:cotton_plant/controller/user_controller.dart';
import 'package:cotton_plant/model/user_model.dart';
import 'package:cotton_plant/services/database_service.dart';
import 'package:cotton_plant/widgets/error_dialog.dart';
import 'package:cotton_plant/widgets/loading_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthService {
  final db = DatabaseService();

  final _auth = FirebaseAuth.instance;
  AuthController get controller => Get.find<AuthController>();
  UserController get userController => Get.find<UserController>();

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      showLoadingDialog(message: "Signing In...");
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _handleAuthStateLoader();
      hideLoadingDialog();
    } on TimeoutException {
      hideLoadingDialog();
      showErrorDialog("Request Timed out");
    } on Exception catch (err) {
      hideLoadingDialog();
      showErrorDialog(err.toString());
    }
  }

  void _handleAuthStateLoader() {
    // controller.authStateLoading = true;
    Get.put(UserController(), permanent: true);
    // controller.authStateLoading = false;
  }

  Future<void> signUpWithEmailAndPassword({
    required String username,
    required String emailAddress,
    required String password,
  }) async {
    showLoadingDialog(message: "Signing Up");
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: emailAddress, password: password);
      final user = UserModel(
        id: cred.user!.uid,
        name: username,
        email: emailAddress,
      );
      await db.userCollection.doc(cred.user!.uid).set(user);
      _handleAuthStateLoader();
      hideLoadingDialog();
    } on FirebaseAuthException catch (e) {
      hideLoadingDialog();
      showErrorDialog(e.toString());
      return;
    }
  }

  // Future<void> sendConfirmationEmail({bool isRetry = false}) async {
  //   try {
  //     await _auth.currentUser!.sendEmailVerification();
  //     if (isRetry) {
  //       Fluttertoast.showToast(msg: "Email Sent", gravity: ToastGravity.BOTTOM);
  //     }
  //   } on FirebaseAuthException catch (err) {
  //     showErrorDialog(err.toString());
  //   }
  // }

  // Future<void> sendPasswordResetEmail(String email) async {
  //   try {
  //     showLoadingDialog(message: "Sending...");
  //     await _auth.sendPasswordResetEmail(email: email);
  //     hideLoadingDialog();
  //     Fluttertoast.showToast(
  //         msg: "Password Reset Email Sent", gravity: ToastGravity.BOTTOM);
  //     Get.back();
  //   } on FirebaseAuthException catch (e) {
  //     hideLoadingDialog();
  //     showErrorDialog(e.toString());
  //   }
  // }

  // Future<void> changePassword({
  //   required String currentPassword,
  //   required String newPassword,
  // }) async {
  //   showLoadingDialog(message: "Updating...");
  //   User user = _auth.currentUser!;
  //   final cred = EmailAuthProvider.credential(
  //       email: user.email!, password: currentPassword);
  //   try {
  //     await user.reauthenticateWithCredential(cred);
  //     await user.updatePassword(newPassword);
  //     hideLoadingDialog();
  //     Get.back();
  //     Fluttertoast.showToast(
  //         msg: "Password Updated", gravity: ToastGravity.BOTTOM);
  //   } on Exception catch (e) {
  //     hideLoadingDialog();
  //     showErrorDialog(e.toString());
  //   }
  // }

  Future<void> signOut() async {
    showLoadingDialog(message: "Signing Out...");
    await _auth.signOut();
    Get.delete<UserController>(force: true);
    hideLoadingDialog();
  }
}
