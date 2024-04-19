import 'package:get/get.dart';
import 'package:angkringan_omaci_ta/app/pages/index.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PESANAN;

  static final routes = [



    // TESTING ROUTES
    GetPage(
      name: Routes.TESTING,
      page: () => const TambahPesananView(),
      binding: TambahPesananBinding(),
    ),



    // OFFICIAL ROUTES
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: Routes.SIGN_IN,
      page: () =>  const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.PESANAN,
      page: () =>  const PesananView(),
      binding: PesananBinding(),
    ), GetPage(
      name: Routes.MENU_RESTORAN,
      page: () =>  const MenuRestoranView(),
      binding: MenuRestoranBinding(),
    ),
    GetPage(
      name: Routes.TAMBAH_PESANAN,
      page: () => const TambahPesananView(),
      binding: TambahPesananBinding(),
    ),



  ];
}
