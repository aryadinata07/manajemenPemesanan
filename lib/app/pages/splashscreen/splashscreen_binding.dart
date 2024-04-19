import 'package:angkringan_omaci_ta/app/pages/index.dart';
import 'package:get/get.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(
          () => SplashScreenController(),
    );
  }
}