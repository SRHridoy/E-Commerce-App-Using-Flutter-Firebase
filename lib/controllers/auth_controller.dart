import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool isLoading = false;

  setLoading(bool loading) {
    isLoading = loading;
    update();
  }

  Future<void> createAccount(String email, String password) async {
    try {
      setLoading(true);
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if(userCredential.user != null) {
        // User created successfully
        Get.snackbar('Success', 'Account created successfully');
      }

    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? 'An error occurred');

    }finally {
      setLoading(false);
    }
  }Future<void> loginAccount(String email, String password) async {
    try {
      setLoading(true);
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if(userCredential.user != null) {
        // User login successfully
        Get.snackbar('Success', 'Login successfully');
      }

    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? 'An error occurred');

    }finally {
      setLoading(false);
    }
  }
}
