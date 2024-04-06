import 'package:get/get.dart';
import 'package:angkringan_omaci_ta/app/pages/login_page/login_page_view.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageView>(
      () => LoginPageView(),
    );
  }
}
