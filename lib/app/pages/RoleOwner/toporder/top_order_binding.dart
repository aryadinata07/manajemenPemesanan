import 'package:angkringan_omaci_ta/app/pages/RoleOwner/toporder/top_order_controller.dart';
import 'package:get/get.dart';

class TopOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopOrderController>(() => TopOrderController());
  }
}