import 'package:get/get.dart';

class SidebarController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final RxInt selectedItemIndex = 1.obs;

  void onItemTapped(int index) {
    selectedItemIndex.value = index;
  }
}