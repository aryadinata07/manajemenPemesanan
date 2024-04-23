import 'package:angkringan_omaci_ta/app/pages/RoleOwner/rekapan/rekapan_controller.dart';
import 'package:get/get.dart';

class RekapanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RekapanController>(() => RekapanController());
  }
}