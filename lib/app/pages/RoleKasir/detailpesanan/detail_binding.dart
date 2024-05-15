import 'package:angkringan_omaci_ta/app/pages/RoleKasir/detailpesanan/detail_controller.dart';
import 'package:get/get.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController());
  }
}
