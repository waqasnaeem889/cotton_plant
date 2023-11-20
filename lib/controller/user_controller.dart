import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cotton_plant/controller/auth_controller.dart';
import 'package:cotton_plant/model/user_model.dart';
import 'package:cotton_plant/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final authController = Get.find<AuthController>();
  final db = DatabaseService();
  //User Variable
  Rxn<UserModel> currentUser = Rxn<UserModel>();
  UserModel? get user => currentUser.value;
  String get currentUid => FirebaseAuth.instance.currentUser!.uid;

  final RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  DocumentReference get currentUserReference =>
      db.userCollection.doc(currentUid);

  Stream<UserModel?> get currentUserStream {
    return db.userCollection
        .doc(currentUid)
        .snapshots()
        .map((event) => event.data());
  }

  @override
  void onInit() {
    currentUser.bindStream(currentUserStream);

    super.onInit();
  }
}
