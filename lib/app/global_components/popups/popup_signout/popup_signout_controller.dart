import 'package:angkringan_omaci_ta/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PopUpSignOutController extends GetxController {
  late SharedPreferences prefs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> logout() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(Routes.SIGN_IN);
  }
}
