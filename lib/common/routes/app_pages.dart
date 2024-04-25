import 'package:get/get.dart';
import 'package:angkringan_omaci_ta/app/pages/index.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

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

    // ROLE OWNER
    GetPage(
      name: Routes.MENU_RESTORAN,
      page: () =>  const MenuRestoranView(),
      binding: MenuRestoranBinding(),
    ),
    GetPage(
      name: Routes.REKAPAN_PEMESANAN,
      page: () =>  const RekapanView(),
      binding: RekapanBinding(),
    ),
    GetPage(
      name: Routes.TOP_ORDER,
      page: () =>  const TopOrderView(),
      binding: TopOrderBinding(),
    ),
    GetPage(
      name: Routes.DAFTAR_HUTANG,
      page: () =>  const DaftarHutangView(),
      binding: DaftarHutangBinding(),
    ),


    // ROLE KASIR
    GetPage(
      name: Routes.PESANAN,
      page: () =>  const PesananView(),
      binding: PesananBinding(),
    ),
    GetPage(
      name: Routes.TAMBAH_PESANAN,
      page: () => const TambahPesananView(),
      binding: TambahPesananBinding(),
    ),



  ];
}
