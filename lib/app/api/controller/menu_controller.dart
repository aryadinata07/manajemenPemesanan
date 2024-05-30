import 'dart:convert';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'package:angkringan_omaci_ta/app/api/models/product_model.dart';
import 'package:angkringan_omaci_ta/app/api/constant/url.dart';
import 'package:get/get.dart';

class ApiMenuController {
  RxBool isAddSuccess = false.obs;
  RxBool isUpdateSuccess = false.obs;

  Future getMenus() async {
    try {
      final response = await http.get(Uri.parse('$url/product'));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print("PRODUCTS: $jsonResponse");
        print("Get Menus Success API CONTROLLER");
        return MenusModel.fromJson(jsonResponse).data;
      } else {
        print("Error: Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      print('Error while fetching menus: $e');
    }
  }

  Future addMenu(String name, double price, int categoryId) async {
    try {
      final Map<String, dynamic> data = {
        'name': name,
        'price': price,
        'category_id': categoryId,
      };

      final response = await http.post(
        Uri.parse('$url/product'),
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        if (responseBody['status'] == 'success') {
          isAddSuccess.value = true;
          print("Add Menu Success API CONTROLLER");
        } else {
          isAddSuccess.value = false;
          print("Add Menu failed: ${responseBody['message']}");
        }
      } else {
        isAddSuccess.value = false;
        print("Error: Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      isAddSuccess.value = false;
      print('Error while adding menu: $e');
    }
  }

  Future updateMenu(int productId, String name, double price, int categoryId) async {
    try {
      final Map<String, dynamic> data = {
        'name': name,
        'price': price,
        'category_id': categoryId,
      };

      final response = await http.post(
        Uri.parse('$url/product/$productId'),
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);

        if (responseBody['status'] == 'success') {
          isUpdateSuccess.value = true;
          print("Update Menu Success API CONTROLLER");
        } else {
          isUpdateSuccess.value = false;
          print("Update Menu failed: ${responseBody['message']}");
        }
      } else {
        isUpdateSuccess.value = false;
        print("Error: Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      isUpdateSuccess.value = false;
      print('Error while updating menu: $e');
    }
  }

  Future deleteMenu(int productId) async {
    try {
      await http.delete(
        Uri.parse('$url/product/$productId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print("Delete Menu Success API CONTROLLER");
    } catch (e) {
      print('Error while deleting product: $e');
    }
  }
}

