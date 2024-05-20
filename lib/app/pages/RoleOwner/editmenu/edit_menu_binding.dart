import 'package:angkringan_omaci_ta/app/pages/RoleOwner/editmenu/edit_menu_controller.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleOwner/rekapan/rekapan_controller.dart';
import 'package:get/get.dart';

class EditMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditMenuController>(() => EditMenuController());
  }
}