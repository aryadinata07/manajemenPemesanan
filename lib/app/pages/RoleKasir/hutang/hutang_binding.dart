import 'package:angkringan_omaci_ta/app/pages/RoleKasir/hutang/hutang_controller.dart';
import 'package:get/get.dart';

class HutangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HutangController>(() => HutangController());
  }
}
