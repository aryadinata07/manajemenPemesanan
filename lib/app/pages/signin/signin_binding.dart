import 'package:angkringan_omaci_ta/app/pages/signin/signin_controller.dart';
import 'package:get/get.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
          () => SignInController(),
    );
  }
}
