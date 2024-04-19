import 'package:get/get.dart';
import 'tambahpesanan_controller.dart';

class TambahPesananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahPesananController>(() => TambahPesananController());
  }
}