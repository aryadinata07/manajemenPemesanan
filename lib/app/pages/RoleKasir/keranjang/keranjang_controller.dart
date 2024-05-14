import 'package:get/get.dart';

class KeranjangController extends GetxController {
  var setCategory = ''.obs;
  void setSelectedCategory(String role) {
    setCategory.value = role;
  }

  var pesanan = [
    {
      'namaMenu': 'Soto Ayam',
      'harga': 'Rp. 30.000',
    },
    {
      'namaMenu': 'Soto Kerbau',
      'harga': 'Rp. 60.000',
    },
    {
      'namaMenu': 'Soto Kerbau',
      'harga': 'Rp. 60.000',
    },
  ];

  @override
  void onInit() {
    super.onInit();
  }
}
