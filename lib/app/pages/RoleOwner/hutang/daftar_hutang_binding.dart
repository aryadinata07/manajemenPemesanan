import 'package:angkringan_omaci_ta/app/pages/RoleOwner/hutang/daftar_hutang_controller.dart';
import 'package:get/get.dart';

class DaftarHutangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarHutangController>(() => DaftarHutangController());
  }
}