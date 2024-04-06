import 'package:get/get.dart';

class LoginPageController extends GetxController {
  var isObscure = true.obs;
  var selectedRole = ''.obs;

  // Properti untuk menyimpan daftar item dropdown

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
