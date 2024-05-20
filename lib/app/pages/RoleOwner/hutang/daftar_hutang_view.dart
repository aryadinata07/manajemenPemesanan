import 'package:angkringan_omaci_ta/app/global_components/appbar_owner.dart';
import 'package:angkringan_omaci_ta/app/global_components/background.dart';
import 'package:angkringan_omaci_ta/app/global_components/hutang_menu.dart';
import 'package:angkringan_omaci_ta/app/global_components/sidebar/sidebar_view.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleOwner/hutang/daftar_hutang_controller.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaftarHutangView extends StatelessWidget {
  const DaftarHutangView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: BackgroundWidget(
        child: GetBuilder<DaftarHutangController>(
          builder: (controller) {
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomAppBar(
                            context: context,
                            title: 'Daftar Hutang',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 23),
                            child: Row(
                              children: [
                                Expanded(
                                    child: SizedBox(
                                  height: 60,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Cari Pesanan',
                                      hintStyle: const TextStyle(
                                        color: grey,
                                      ),
                                      filled: true,
                                      fillColor: textFieldBackground,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide.none,
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.search,
                                        color: grey,
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color:
                                          grey, // Set the color of the entered value to grey
                                    ),
                                  ),
                                )),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: ListView.builder(
                                itemCount: controller.hutang.length,
                                itemBuilder: (context, index) {
                                  final menu = controller.hutang[index];
                                  return HutangCard(
                                    nama: menu['namaPemesan']!,
                                    item: menu['item']!,
                                    totalPesanan: menu['total']!,
                                    pembayaran: menu['pembayaran']!,
                                    tempatMakan: menu['tempat']!,
                                    jumlahPesnan: menu['jumlahPesanan']!,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  FloatingActionButton floatingButton() {
    return FloatingActionButton(
      backgroundColor: primaryAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      onPressed: () {
        // Get.toNamed(Routes.TAMBAH_PESANAN);
      },
      child: const Icon(Icons.add, color: Colors.white, size: 35),
    );
  }
}
