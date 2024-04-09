import 'package:angkringan_omaci_ta/app/pages/signin/signin_view.dart';
import 'package:get/get.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInPage>(
          () => SignInPage(),
    );
  }
}
