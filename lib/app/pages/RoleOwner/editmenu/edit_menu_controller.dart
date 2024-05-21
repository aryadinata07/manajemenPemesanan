import 'package:get/get.dart';

class EditMenuController extends GetxController {
  var setCategory = ''.obs;
  void setSelectedCategory(String role) {
    setCategory.value = role;
  }

  final int maxLength = 40;
  var currentText = ''.obs;
  void updateText(String text) {
    if (text.length <= maxLength) {
      currentText.value = text;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
