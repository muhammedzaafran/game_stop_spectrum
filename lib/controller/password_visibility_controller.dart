import 'package:get/get.dart';

class PasswordVisibilityController extends GetxController {
  RxBool passwordVisible = true.obs;

  void updateVisibility() {
    // Toggle the visibility state
    passwordVisible.toggle();

    // Notify observers about the change
    update();
  }
}
