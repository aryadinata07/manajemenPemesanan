import 'package:angkringan_omaci_ta/app/pages/RoleKasir/pesanan/pesanan_controller.dart';
import 'package:get/get.dart';

class PesananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PesananController>(() => PesananController());
  }
}