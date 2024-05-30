import 'package:angkringan_omaci_ta/app/api/controller/order_controller.dart';
import 'package:angkringan_omaci_ta/app/api/models/order_model.dart';
import 'package:get/get.dart';

class PesananController extends GetxController {
  RxList orders = <Orders>[].obs;
  RxList filteredOrders = <Orders>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getOrders();
  }

  Future getOrders() async {
    isLoading.value = true;
    try {
      var orderData = await ApiOrderController().getOrders();
      orders.value = orderData;
      filteredOrders.value = orderData;
      print("Get Orders Success MENU RESTORAN CONTROLLER");
      isLoading.value = false;
    } catch (e) {
      print("Error fetching orders: $e");
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

  void searchOrders(String query) {
    if (query.isEmpty) {
      filteredOrders.value = orders;
    } else {
      filteredOrders.value = orders
          .where((order) =>
          order.customerName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
