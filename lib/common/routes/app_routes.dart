part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  //TESTING ROUTES
  static const TESTING = '/testing';

  // OFFICIAL ROUTES
  static const SPLASH_SCREEN = '/splashscreen';
  static const SIGN_IN = '/signin';

  // ROLE OWNER
  static const MENU_RESTORAN = '/menurestoran';
  static const REKAPAN_PEMESANAN = '/rekapanpemesanan';
  static const TOP_ORDER = '/toporder';
  static const DAFTAR_HUTANG = '/daftarhutang';
  static const DETAIL_PESANAN = '/detailpesanan';
  static const HUTANG_DETAIL = '/hutangdetail';
  static const TAMBAH_MENU = '/tambahmenu';
  static const EDIT_MENU = '/editmenu';

  // ROLE KASIR
  static const PESANAN = '/pesanan';
  static const TAMBAH_PESANAN = '/tambahpesanan';
  static const KERANJANG = '/keranjang';
  static const HUTANG = '/hutang';
}
