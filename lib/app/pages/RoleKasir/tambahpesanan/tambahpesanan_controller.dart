import 'package:angkringan_omaci_ta/app/api/controller/menu_controller.dart';
import 'package:get/get.dart';
import 'package:angkringan_omaci_ta/app/api/models/category_model.dart';
import 'package:angkringan_omaci_ta/app/api/models/product_model.dart';

class TambahPesananController extends GetxController {
  RxList<Menus> menus = <Menus>[].obs;
  RxList<Menus> filteredMenus = <Menus>[].obs;
  RxList<Categories> categories = <Categories>[].obs;
  RxList<Menus> selectedMenus = <Menus>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getMenus();
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

  void addMenuToSelected(Menus menu) {
    final existingMenu = selectedMenus.firstWhere(
      (item) => item.productName == menu.productName,
      orElse: () => menu,
    );
    if (selectedMenus.contains(existingMenu)) {
      existingMenu.quantity += 1;
    } else {
      menu.quantity = 1;
      selectedMenus.add(menu);
    }
  }

  void removeMenuFromSelected(Menus menu) {
    selectedMenus.remove(menu);
  }

  bool isMenuSelected(Menus menu) {
    return selectedMenus.contains(menu);
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
