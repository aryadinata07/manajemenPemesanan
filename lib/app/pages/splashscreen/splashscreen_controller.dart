import 'package:angkringan_omaci_ta/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  late final SharedPreferences prefs;

  @override
  void onInit() {
    super.onInit();
    checkSharedPreference();
  }

  void checkSharedPreference() async {
    prefs = await SharedPreferences.getInstance();

    if (prefs.getString('role') == "Kasir") {
      Future.delayed(const Duration(seconds: 2), () {
        Get.offNamed(Routes.PESANAN);
      });
    } else if (prefs.getString('role') == "Owner") {
      Future.delayed(const Duration(seconds: 2), () {
        Get.offNamed(Routes.MENU_RESTORAN);
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        Get.offNamed(Routes.SIGN_IN);
      });
    }
  }

}
