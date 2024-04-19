import 'package:angkringan_omaci_ta/common/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(Routes.SIGN_IN);
    });
  }
}
