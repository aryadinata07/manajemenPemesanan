import 'package:angkringan_omaci_ta/app/api/controller/category_controller.dart';
import 'package:angkringan_omaci_ta/app/api/controller/menu_controller.dart';
import 'package:angkringan_omaci_ta/app/api/models/category_model.dart';
import 'package:get/get.dart';
import 'package:angkringan_omaci_ta/app/api/models/product_model.dart';

class MenuRestoranController extends GetxController {
  RxList menus = <Menus>[].obs;
  RxList filteredMenus = <Menus>[].obs;
  RxList categories = <Categories>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getMenus();
    getCategories();
  }



  Future getMenus() async {
    isLoading.value = true;
    try {
      var productData = await ApiMenuController().getMenus();
      menus.value = productData;
      filteredMenus.value = productData;
      print("Get Menus Success MENU RESTORAN CONTROLLER");
      isLoading.value = false;
    } catch (e) {
      print("Error fetching products: $e");
    }
  }

  Future getCategories() async {
    isLoading.value = true;
    try {
      var categoriesData = await ApiCategoryController().getCategories();
      categories.value = categoriesData;
      print("Get Categories Success MENU RESTORAN CONTROLLER");
      isLoading.value = false;
    } catch (e) {
      print("Error fetching categories: $e");
    }
  }


  void searchMenus(String query) {
    if (query.isEmpty) {
      filteredMenus.value = menus;
    } else {
      filteredMenus.value = menus
          .where((product) =>
          product.productName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  Future deleteMenu(int productId) async {
    try {
      await ApiMenuController().deleteMenu(productId);
      getMenus();
    } catch (e) {
      print("Error deleting product: $e");
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



