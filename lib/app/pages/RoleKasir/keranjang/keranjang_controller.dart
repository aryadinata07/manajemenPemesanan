import 'package:get/get.dart';

class KeranjangController extends GetxController {
  var setCategory = ''.obs;
  void setSelectedCategory(String role) {
    setCategory.value = role;
  }

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

  void updateItemQuantity(int index, int quantity) {
    pesanan[index]['item'] = quantity;
    hitungTotalHarga();
  }

  void incrementQuantity(int index) {
    pesanan[index]['item'] += 1;
    hitungTotalHarga();
  }

  void decrementQuantity(int index) {
    if (pesanan[index]['item'] > 0) {
      pesanan[index]['item'] -= 1;
      hitungTotalHarga();
    }
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
