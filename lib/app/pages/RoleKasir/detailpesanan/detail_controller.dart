import 'package:angkringan_omaci_ta/app/api/controller/order_controller.dart';
import 'package:angkringan_omaci_ta/app/api/models/order_model.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
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

  Future getOrderById(int orderId) async {
    try {
      print("ORDER ID: $orderId");
      Orders order = orders.firstWhere((order) => order.customer == orderId);
      print("ORDER: $order");
      if (order != null) {
        // Clear the filteredOrders list and add the found order
        filteredOrders.clear();
        filteredOrders.add(order);
        print("FILTERED ORDER: $filteredOrders");
      } else {
        // If order with given orderId is not found, show error message or handle accordingly
        print("Order with ID $orderId not found.");
      }
    } catch (e) {
      print("Error fetching order by id: $e");
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
}
