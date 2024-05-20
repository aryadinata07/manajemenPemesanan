import 'package:angkringan_omaci_ta/app/pages/RoleKasir/keranjang/keranjang_controller.dart';
import 'package:get/get.dart';

class KeranjangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KeranjangController>(() => KeranjangController());
  }
}
