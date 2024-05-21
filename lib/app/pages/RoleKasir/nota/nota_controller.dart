import 'package:get/get.dart';

class NotaController extends GetxController {
  var pesanan = <Map<String, dynamic>>[
    {
      'namaMenu': 'Soto Ayam',
      'harga': '30000',
      'item': 1,
    },
    {
      'namaMenu': 'Soto Kerbau',
      'harga': '60000',
      'item': 2,
    },
    {
      'namaMenu': 'Soto Kerbau',
      'harga': '60000',
      'item': 2,
    },
  ].obs;

  var totalHarga = 0.obs;

  void hitungTotalHarga() {
    int total = 0;
    for (var item in pesanan) {
      total += int.parse(item['harga'] as String) * (item['item'] as int);
    }
    totalHarga.value = total;
  }

  String formatCurrency(int amount) {
    String amountString = amount.toString();
    String formatted = '';
    for (int i = 0; i < amountString.length; i++) {
      if (i != 0 && (amountString.length - i) % 3 == 0) {
        formatted += '.';
      }
      formatted += amountString[i];
    }
    return formatted;
  }

  @override
  void onInit() {
    super.onInit();
    hitungTotalHarga();
  }
}
