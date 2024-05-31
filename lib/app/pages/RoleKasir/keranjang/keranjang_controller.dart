import 'package:angkringan_omaci_ta/app/api/controller/order_controller.dart';
import 'package:angkringan_omaci_ta/app/pages/index.dart';
import 'package:get/get.dart';

class KeranjangController extends GetxController {
  var setCategory = ''.obs;
  final int maxLength = 40;
  var currentText = ''.obs;
  var notesText = ''.obs;
  final tambahPesananController = Get.find<TambahPesananController>();
  ApiOrderController apiOrderController = ApiOrderController();

  @override
  void onInit() {
    super.onInit();
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var menu in tambahPesananController.selectedMenus) {
      double productPrice = double.tryParse(menu.productPrice) ?? 0.0;
      totalPrice += menu.quantity * productPrice;
    }
    return totalPrice;
  }

  void setSelectedCategory(String role) {
    setCategory.value = role;
  }

    void updateNotes(String text) {
    notesText.value = text;
  }
  

  void updateText(String text) {
    if (text.length <= maxLength) {
      currentText.value = text;
    }
  }

  String formatPrice(double price) {
    String priceStr = price.toStringAsFixed(2);
    if (priceStr.endsWith(".00")) {
      priceStr = priceStr.substring(0, priceStr.length - 3);
    }
    final buffer = StringBuffer();
    final chars = priceStr.split('').reversed.toList();
    for (int i = 0; i < chars.length; i++) {
      if (i != 0 && i % 3 == 0) {
        buffer.write('.');
      }
      buffer.write(chars[i]);
    }
    return "Rp ${buffer.toString().split('').reversed.join('')}";
  }
}
