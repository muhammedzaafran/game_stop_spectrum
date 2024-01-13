import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/user_model.dart';
import '../view/auth_ui/email_validation.dart';

class EmailPassController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? currentUser;
  Future<void> signupUser(String email, String password, String name) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await userCredential.user!.updateDisplayName(name);
      await userCredential.user!.updateEmail(email);

      UserModel userModel = UserModel(
        uId: userCredential.user!.uid,
        username: userCredential.user!.displayName ?? name,
        email: userCredential.user!.email ?? '',
        phone: userCredential.user!.phoneNumber ?? '',
        userImg: userCredential.user!.photoURL ??
            'https://firebasestorage.googleapis.com/v0/b/dealninja-2b50b.appspot.com/o/User.png?alt=media&token=b2e7d3ec-7ff6-4567-84b5-d9cee26253f2',
        country: '',
        userAddress: '',
        street: '',
        isAdmin: false,
        isActive: true,
        createdOn: DateTime.now(),
        city: '',
      );
      try {
        await FirebaseFirestore.instance // Save user data to Firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(userModel.toMap());
      } catch (error) {
        print('Error saving user data to Firestore: $error');
        Get.snackbar(
          "Error",
          "$error",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      Get.snackbar('Success', 'Registration Successful');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'Password Provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'Email Provided already Exists');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> checkCurrentUser() async {
    try {
      // Fetch the current user
      currentUser = auth.currentUser;

      if (currentUser != null) {
        // User is signed in, you can access currentUser properties here
        print('Current user UID: ${currentUser!.uid}');
        Get.off(() => EmailValidationScreen(user: currentUser!),
            transition: Transition.leftToRightWithFade);
      } else {
        // No user is signed in
        Get.snackbar('No user is', 'currently authenticated');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
