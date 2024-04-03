import 'package:get/get.dart';
import 'package:angkringan_omaci_ta/app/pages/index.dart';

part 'app_routes.dart';

class AppPages {

  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => SplashScreenPage(),
      binding: SplashScreenBinding(),
      transition: Transition.noTransition,
    ),
  ];
}