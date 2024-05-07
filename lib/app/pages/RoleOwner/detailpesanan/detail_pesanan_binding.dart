import 'package:angkringan_omaci_ta/app/pages/RoleOwner/detailpesanan/detail_pesanan_controller.dart';
import 'package:get/get.dart';

class DetailPesananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPesananController>(() => DetailPesananController());
  }
}
