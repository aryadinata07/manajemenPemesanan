import 'package:angkringan_omaci_ta/app/pages/splashscreen/splashscreen_view.dart';
import 'package:get/get.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenView>(
          () => SplashScreenView(),
    );
  }
}