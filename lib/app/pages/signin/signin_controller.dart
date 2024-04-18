import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  var isObscure = true.obs;
  var selectedRole = ''.obs;
  var ownerPassword = 'owner';
  var kasirPassword = 'kasir';
  TextEditingController passwordController = TextEditingController();

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

    // Define the expected passwords for each role
    String expectedPassword;
    if (role == 'Owner') {
      expectedPassword = ownerPassword;
    } else if (role == 'Kasir') {
      expectedPassword = kasirPassword;
    } else {
      print('Please select a role.');
      return;
    }

    if (enteredPassword == expectedPassword) {
      print('Login successful for role: $role');
    } else {
      print('Invalid password for role: $role');
    }
  }

}
