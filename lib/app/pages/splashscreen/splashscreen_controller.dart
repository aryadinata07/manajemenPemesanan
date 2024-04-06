import 'package:get/get.dart';
import 'package:angkringan_omaci_ta/app/pages/login_page/login_page_view.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 1), () {
      Get.off(LoginPageView()); 
    });
  }
}
