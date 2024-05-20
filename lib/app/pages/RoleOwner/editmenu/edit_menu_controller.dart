import 'package:get/get.dart';

class EditMenuController extends GetxController {
  var setCategory = ''.obs;
  void setSelectedCategory(String role) {
    setCategory.value = role;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
