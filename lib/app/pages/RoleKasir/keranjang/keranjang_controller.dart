import 'package:angkringan_omaci_ta/app/api/models/product_model.dart';
import 'package:get/get.dart';

class KeranjangController extends GetxController {
  var setCategory = ''.obs;
  final int maxLength = 40;
  var currentText = ''.obs;


  void setSelectedCategory(String role) {
    setCategory.value = role;
  }

  void updateText(String text) {
    if (text.length <= maxLength) {
      currentText.value = text;
    }


  }



  String formatPrice(String price) {
    if (price.endsWith(".00")) {
      price = price.substring(0, price.length - 3);
    }
    final buffer = StringBuffer();
    final chars = price.split('').reversed.toList();
    for (int i = 0; i < chars.length; i++) {
      if (i != 0 && i % 3 == 0) {
        buffer.write('.');
      }
      buffer.write(chars[i]);
    }
    return "Rp ${buffer.toString().split('').reversed.join('')}";
  }

  @override
  void onInit() {
    super.onInit();
  }
}
