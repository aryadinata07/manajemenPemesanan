import 'dart:convert';
import 'package:angkringan_omaci_ta/app/api/constant/url.dart';
import 'package:angkringan_omaci_ta/app/api/models/order_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiOrderController extends GetxController {
  RxBool isAddSuccess = false.obs;
  RxBool isUpdateSuccess = false.obs;

  Future getOrders() async {
    try {
      final response = await http.get(Uri.parse('$url/order'));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print("ORDERS: $jsonResponse");
        print("Get Orders Success API CONTROLLER");
        return OrderModel.fromJson(jsonResponse).data;
      } else {
        print("Error: Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      print('Error while fetching orders: $e');
    }
  }

  Future addOrder(
      String customerName,
      int customerServeId,
      int? customerPaymentId,
      bool? customerOrderStatus,
      String? customerNotes,
      String? customerPhoneNumber,
      List<Map<String, int>> products,
      ) async {
    try {
      final Map<String, dynamic> data = {
        'name': customerName,
        if (customerPaymentId != null) 'payment_id': customerPaymentId,
        if (customerOrderStatus != null) 'order_status': customerOrderStatus,
        'serve_id': customerServeId,
        if (customerNotes != null) 'notes': customerNotes,
        if (customerPhoneNumber != null) 'phone_number': customerPhoneNumber,
        'products': products,
      };

      final response = await http.post(
        Uri.parse('$url/order'),
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 201) {
        final responseBody = json.decode(response.body);
        if (responseBody['status'] == 'success') {
          isAddSuccess.value = true;
          print("Add Order Success API CONTROLLER");
        } else {
          isAddSuccess.value = false;
          print("Add Order failed: ${responseBody['message']}");
        }
      } else {
        isAddSuccess.value = false;
        print("Error: Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      isAddSuccess.value = false;
      print('Error while adding order: $e');
    }
  }

  Future updateOrder(int orderId, Orders updatedOrder) async {
    try {
      final response = await http.put(
        Uri.parse('$url/orders/$orderId'),
        body: json.encode(updatedOrder.toJson()),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        if (responseBody['status'] == 'success') {
          isUpdateSuccess.value = true;
          print("Update Order Success API CONTROLLER");
        } else {
          isUpdateSuccess.value = false;
          print("Update Order failed: ${responseBody['message']}");
        }
      } else {
        isUpdateSuccess.value = false;
        print("Error: Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      isUpdateSuccess.value = false;
      print('Error while updating order: $e');
    }
  }

  Future deleteOrder(int orderId) async {
    try {
      final response = await http.delete(
        Uri.parse('$url/orders/$orderId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        print("Delete Order Success API CONTROLLER");
      } else {
        print("Error: Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      print('Error while deleting order: $e');
    }
  }
}
