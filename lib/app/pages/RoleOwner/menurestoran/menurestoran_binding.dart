import 'package:angkringan_omaci_ta/app/pages/RoleOwner/menurestoran/menurestoran_controller.dart';
import 'package:get/get.dart';

class MenuRestoranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuRestoranController>(() => MenuRestoranController());
  }
}