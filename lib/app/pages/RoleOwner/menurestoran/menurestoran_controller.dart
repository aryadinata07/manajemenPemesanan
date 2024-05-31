import 'package:angkringan_omaci_ta/app/api/controller/category_controller.dart';
import 'package:angkringan_omaci_ta/app/api/controller/menu_controller.dart';
import 'package:angkringan_omaci_ta/app/api/models/category_model.dart';
import 'package:angkringan_omaci_ta/app/api/models/product_model.dart';
import 'package:get/get.dart';

class MenuRestoranController extends GetxController {
  RxList<Menus> menus = <Menus>[].obs;
  RxList<Categories> categories = <Categories>[].obs;
  RxList<Menus> filteredMenus = <Menus>[].obs;
  Rx<Categories?> selectedCategory = Rx<Categories?>(null);
  RxString searchQuery = ''.obs;
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
    } catch (e) {
      print("Error fetching products: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getCategories() async {
    isLoading.value = true;
    try {
      var categoriesData = await ApiCategoryController().getCategories();
      categories.value = categoriesData;
      print("Get Categories Success MENU RESTORAN CONTROLLER");
    } catch (e) {
      print("Error fetching categories: $e");
    } finally {
      isLoading.value = false;
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

  void filterMenusByCategory(int? categoryId) {
    if (categoryId == null) {
      selectedCategory.value = null;
    } else {
      selectedCategory.value = categories.firstWhere((category) => category.categoryId == categoryId);
    }
    applyFilters();
  }

  void applyFilters() {
    List<Menus> results = menus;

    if (searchQuery.value.isNotEmpty) {
      results = results.where((menu) => menu.productName.toLowerCase().contains(searchQuery.value)).toList();
    }

    if (selectedCategory.value != null) {
      results = results.where((menu) => menu.productCategoryId == selectedCategory.value!.categoryId).toList();
    }

    filteredMenus.value = results;
  }

  void clearFilters() {
    // searchQuery.value = '';
    selectedCategory.value = null;
    filteredMenus.value = menus;
  }
}
