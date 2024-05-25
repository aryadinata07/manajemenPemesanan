import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


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

  var selectedImagePath = ''.obs;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImagePath.value = image.path;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
