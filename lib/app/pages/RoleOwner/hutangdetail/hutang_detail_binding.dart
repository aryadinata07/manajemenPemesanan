import 'package:angkringan_omaci_ta/app/pages/RoleOwner/detailpesanan/detail_pesanan_controller.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleOwner/hutangdetail/hutang_detail_controller.dart';
import 'package:get/get.dart';

class HutangDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HutangDetailController>(() => HutangDetailController());
  }
}
