import 'package:angkringan_omaci_ta/app/global_components/sidebar/sidebar_controller.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:angkringan_omaci_ta/common/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInController extends GetxController {
  late SharedPreferences prefs;

  var isObscure = true.obs;
  var selectedRole = ''.obs;
  var ownerPassword = 'owner';
  var kasirPassword = 'kasir';
  TextEditingController passwordController = TextEditingController();
  var isPasswordIncorrect = false.obs;
  var prefsInitialized = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkPrefsInitialization();
  }

  void setSelectedRole(String role) {
    selectedRole.value = role;
  }

  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }

  Future<void> checkPrefsInitialization() async {
    if (!prefsInitialized.value) {
      prefs = await SharedPreferences.getInstance();
      prefsInitialized.value = true; // Mark prefs as initialized
    }
  }


  void checkCredentials() async {
    await checkPrefsInitialization(); // Ensure prefs is initialized

    String role = selectedRole.value;
    String enteredPassword = passwordController.text;

    if (role.isEmpty) {
      print('Tolong pilih role.');
    } else if (enteredPassword.isEmpty) {
      print('Tolong isi password terlebih dahulu.');
      Get.snackbar(
        'Password Kosong',
        'Tolong isi password terlebih dahulu.',
        backgroundColor: red,
        colorText: white,
      );
    } else {
      if (role == 'Owner') {
        if (enteredPassword == ownerPassword) {
          print('Sign in berhasil untuk role: $role');
          Get.snackbar(
            'Sign in berhasil untuk role: $role',
            'Selamat datang.',
            backgroundColor: green,
            colorText: white,
          );
          Get.offAllNamed(Routes.MENU_RESTORAN);
          await prefs.setString('role', role);
        } else {
          print('Invalid password for role: $role');
          Get.snackbar(
            'Password Salah',
            'Password salah untuk role: $role',
            backgroundColor: red,
            colorText: white,
          );
          isPasswordIncorrect.value = true;
        }
      } else if (role == 'Kasir') {
        if (enteredPassword == kasirPassword) {
          print('Sign in berhasil untuk role: $role');
          Get.snackbar(
            'Sign in berhasil untuk role: $role',
            'Selamat datang.',
            backgroundColor: green,
            colorText: white,
          );
          Get.offAllNamed(Routes.PESANAN);
          await prefs.setString('role', role);
        } else {
          print('Invalid password for role: $role');
          Get.snackbar(
            'Password Salah',
            'Password salah untuk role: $role',
            backgroundColor: red,
            colorText: white,
          );
          isPasswordIncorrect.value = true;
        }
      }
    }
  }
}
