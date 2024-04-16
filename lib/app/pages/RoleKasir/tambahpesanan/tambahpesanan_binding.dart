import 'package:angkringan_omaci_ta/app/pages/RoleKasir/tambahpesanan/tambahpesanan_view.dart';
import 'package:get/get.dart';

class TambahPesananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahPesananView>(
      () => TambahPesananView(),
    );
  }
}
