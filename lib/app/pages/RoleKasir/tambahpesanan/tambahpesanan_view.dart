// TambahPesananView.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:angkringan_omaci_ta/app/global_components/menu_item.dart';
import 'package:angkringan_omaci_ta/app/global_components/appBar.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:angkringan_omaci_ta/app/global_components/background.dart';

import 'tambahpesanan_controller.dart'; // Import controller

class TambahPesananView extends StatelessWidget {
  const TambahPesananView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: GetBuilder<TambahPesananController>(
          builder: (controller) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(
                      children: [
                        appBar(
                          title: "Tambah Pesanan",
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 22),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 58, 58),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: const Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.search,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Expanded(
                                        child: TextField(
                                          style: TextStyle(color: Colors.white),
                                          decoration: InputDecoration(
                                            hintText: 'Cari menu restaurant',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 24, 194, 160),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.filter_list,
                                    color: white,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Column(
                          children: controller.foods.map((food) {
                            return MenuItem(
                              foodName: food['name']!,
                              foodCategory: food['category']!,
                              foodPrice: food['price']!,
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5BA48F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        // Tambahkan logika untuk tombol di sini
                      },
                      child: Text(
                        'Lanjut',
                        style: GoogleFonts.nunito(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
