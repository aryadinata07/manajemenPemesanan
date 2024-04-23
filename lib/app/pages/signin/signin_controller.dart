import 'package:angkringan_omaci_ta/common/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  var isObscure = true.obs;
  var selectedRole = ''.obs;
  var ownerPassword = 'owner';
  var kasirPassword = 'kasir';
  TextEditingController passwordController = TextEditingController();
  var isPasswordIncorrect = false.obs;

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

  void checkCredentials() {
    String role = selectedRole.value;
    String enteredPassword = passwordController.text;

    if (role.isEmpty) {
      print('Please select a role.');
    } else if (enteredPassword.isEmpty) {
      print('Please fill in the password.');
    } else {
      if (role == 'Owner') {
        if (enteredPassword == ownerPassword) {
          print('Login successful for role: $role');
          Get.offNamed(Routes.MENU_RESTORAN);
        } else {
          print('Invalid password for role: $role');
          isPasswordIncorrect.value = true;
        }
      } else if (role == 'Kasir') {
        if (enteredPassword == kasirPassword) {
          print('Login successful for role: $role');
          Get.offNamed(Routes.PESANAN);
        } else {
          print('Invalid password for role: $role');
          isPasswordIncorrect.value = true;
        }
      }
    }
  }
}
