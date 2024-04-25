import 'package:get/get.dart';

class SidebarController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final RxInt selectedItemIndex = 1.obs;

  void onItemTapped(int index) {
    selectedItemIndex.value = index;
    // switch (index) {
    //   case 1:
    //     Get.toNamed(Routes.MENU_RESTORAN);
    //     break;
    //   case 2:
    //     Get.toNamed(Routes.REKAPAN_PEMESANAN);
    //     break;
    //   case 3:
    //     Get.toNamed(Routes.TOP_ORDER);
    //     break;
    //   case 4:
    //     Get.toNamed(Routes.DAFTAR_HUTANG);
    //     break;
    // }
  }
}