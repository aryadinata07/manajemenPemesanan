import 'package:get/get.dart';

class SignInController extends GetxController {
  var isObscure = true.obs;
  var selectedRole = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void setSelectedRole(String role) {
    selectedRole.value = role;
  }

  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }
}
