import 'package:angkringan_omaci_ta/app/pages/RoleKasir/nota/nota_controller.dart';
import 'package:get/get.dart';

class NotaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotaController>(() => NotaController());
  }
}
