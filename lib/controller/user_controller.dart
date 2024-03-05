
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
  final Rxn<UserModel> currentUser = Rxn<UserModel>();
  UserModel? get user => currentUser.value;
  String get currentUid => FirebaseAuth.instance.currentUser!.uid;

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
    log(currentUserStream.toString());
    //currentUser.bindStream(currentUserStream);
    super.onInit();
  }

  Future<UserModel> getUserModel(String uid) async {
  var docs = await db.userCollection.doc(uid).get(); 
  return docs.data()!;
  }

  @override
  void onReady()async  {

    if(FirebaseAuth.instance.currentUser != null){
currentUser.value = await getUserModel(currentUid);
    }
    update();
    super.onReady();
  }
}
