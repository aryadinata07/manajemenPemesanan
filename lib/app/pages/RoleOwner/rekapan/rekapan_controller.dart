import 'package:get/get.dart';

class RekapanController extends GetxController {
  var rekapan = [
    {
      'namaPemesan': 'Budi Setiawan',
      'item': '3',
      'total': 'Rp 48.000',
      'pembayaran': "Tunai",
      'tempat': "makan di tempat",
      'jumlahPesanan': '5',
    },
    {
      'namaPemesan': 'Dewi Susanti',
      'item': '2',
      'total': 'Rp 35.000',
      'pembayaran': "QRIS",
      'tempat': "bawa pulang",
      'jumlahPesanan': '2',
    },
    {
      'namaPemesan': 'Putra Wijaya',
      'item': '1',
      'total': 'Rp 28.000',
      'pembayaran': "Tunai",
      'tempat': "antar",
      'jumlahPesanan': '1',
    },
    {
      'namaPemesan': 'Sari Rahayu',
      'item': '4',
      'total': 'Rp 60.000',
      'pembayaran': "QRIS",
      'tempat': "makan di tempat",
      'jumlahPesanan': '3',
    },
    {
      'namaPemesan': 'Adi Santoso',
      'item': '1',
      'total': 'Rp 50.000',
      'pembayaran': "Tunai",
      'tempat': "bawa pulang",
      'jumlahPesanan': '1',
    },
  ];

  @override
  void onInit() {
    super.onInit();
  }
}
