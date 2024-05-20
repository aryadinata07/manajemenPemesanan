import 'package:angkringan_omaci_ta/app/pages/RoleOwner/tambahmenu/tambah_menu_controller.dart';
import 'package:get/get.dart';

class TambahMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahMenuController>(() => TambahMenuController());
  }
}
