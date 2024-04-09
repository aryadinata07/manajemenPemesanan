import 'package:angkringan_omaci_ta/app/pages/signin/signin_view.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(SignInPage());
    });
  }
}
