import 'package:angkringan_omaci_ta/app/global_components/appbar_owner.dart';
import 'package:angkringan_omaci_ta/app/global_components/background.dart';
import 'package:angkringan_omaci_ta/app/global_components/rekapan_menu.dart';
import 'package:angkringan_omaci_ta/app/global_components/sidebar/sidebar_view.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleOwner/rekapan/rekapan_controller.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RekapanView extends StatelessWidget {
  const RekapanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: BackgroundWidget(
        child: GetBuilder<RekapanController>(
          builder: (controller) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                    context: context,
                    title: 'Rekapan Pemesanan',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '01 Mar - 10 Mar 2024',
                              hintStyle: const TextStyle(
                                color: grey,
                              ),
                              filled: true,
                              fillColor: textFieldBackground,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: const Icon(
                                Icons.calendar_today,
                                color: grey,
                                size: 20,
                              ),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.expand_more_outlined),
                                iconSize: 30,
                                color: white,
                                onPressed: () {},
                              ),
                            ),
                            style: const TextStyle(
                              color: grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          height: 60,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Cari rekapan pesanan',
                              hintStyle: const TextStyle(
                                color: grey,
                              ),
                              filled: true,
                              fillColor: textFieldBackground,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: grey,
                              ),
                            ),
                            style: const TextStyle(
                              color: grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: ListView.builder(
                        itemCount: controller.rekapan.length,
                        itemBuilder: (context, index) {
                          final menu = controller.rekapan[index];
                          return RekapanCard(
                            nama: menu['namaPemesan']!,
                            item: menu['item']!,
                            kodePesanan: menu['kode']!,
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
