import 'package:angkringan_omaci_ta/app/pages/RoleKasir/hutang/hutang_binding.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleKasir/hutang/hutang_view.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleKasir/keranjang/keranjang_binding.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleKasir/keranjang/keranjang_view.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleOwner/detailpesanan/detail_pesanan_binding.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleOwner/detailpesanan/detail_pesanan_view.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleOwner/editmenu/edit_menu_binding.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleOwner/editmenu/edit_menu_view.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleOwner/hutangdetail/hutang_detail_binding.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleOwner/hutangdetail/hutang_detail_view.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleOwner/tambahmenu/tambah_menu_binding.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleOwner/tambahmenu/tambah_menu_view.dart';
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
      page: () => const HutangView(),
      binding: HutangBinding(),
    ),

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
      page: () => const MenuRestoranView(),
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
  ];
}
