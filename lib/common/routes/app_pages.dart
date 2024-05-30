import 'package:get/get.dart';
import 'package:angkringan_omaci_ta/app/pages/index.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    // TESTING ROUTES
    // GetPage(
    //   name: Routes.TESTING,
    //   page: () => const DetailView(),
    //   binding: DetailBinding(),
    // ),



    // OFFICIAL ROUTES
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: Routes.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),



    // ROLE OWNER
    GetPage(
      name: Routes.MENU_RESTORAN,
      page: () => MenuRestoranView(),
      binding: MenuRestoranBinding(),
    ),
    GetPage(
      name: Routes.REKAPAN_PEMESANAN,
      page: () => const RekapanView(),
      binding: RekapanBinding(),
    ),
    GetPage(
      name: Routes.TOP_ORDER,
      page: () => const TopOrderView(),
      binding: TopOrderBinding(),
    ),
    GetPage(
      name: Routes.DAFTAR_HUTANG,
      page: () => const DaftarHutangView(),
      binding: DaftarHutangBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_PESANAN,
      page: () => const DetailPesananView(),
      binding: DetailPesananBinding(),
    ),
    GetPage(
      name: Routes.HUTANG_DETAIL,
      page: () => const HutangDetailView(),
      binding: HutangDetailBinding(),
    ),
    GetPage(
      name: Routes.TAMBAH_MENU,
      page: () => const TambahMenuView(),
      binding: TambahMenuBinding(),
    ),
    GetPage(
      name: Routes.EDIT_MENU,
      page: () => const EditMenuView(),
      binding: EditMenuBinding(),
    ),



    // ROLE KASIR
    GetPage(
      name: Routes.PESANAN,
      page: () => const PesananView(),
      binding: PesananBinding(),
    ),
    GetPage(
      name: Routes.TAMBAH_PESANAN,
      page: () => const TambahPesananView(),
      binding: TambahPesananBinding(),
    ),
    GetPage(
      name: Routes.KERANJANG,
      page: () => const KeranjangView(),
      binding: KeranjangBinding(),
    ),
    GetPage(
      name: Routes.HUTANG,
      page: () => const HutangView(),
      binding: HutangBinding(),
    ),
    // GetPage(
    //   name: Routes.DETAIL,
    //   page: () => DetailView(orderId: 0),
    //   binding: DetailBinding(),
    // ),
    GetPage(
      name: Routes.NOTA,
      page: () => const NotaView(),
      binding: NotaBinding(),
    )
  ];
}
