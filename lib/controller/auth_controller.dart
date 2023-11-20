import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rx<User?> _firebaseUser = Rx<User?>(null);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get user => _firebaseUser.value;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }
}
