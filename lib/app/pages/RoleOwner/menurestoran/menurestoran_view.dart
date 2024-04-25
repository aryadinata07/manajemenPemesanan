import 'package:angkringan_omaci_ta/app/global_components/background.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:angkringan_omaci_ta/common/routes/app_pages.dart';
import 'package:angkringan_omaci_ta/app/global_components/popUp_logOut.dart';
import 'package:google_fonts/google_fonts.dart';
import 'menurestoran_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuRestoranView extends StatelessWidget {
  const MenuRestoranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {
          // Get.toNamed(Routes.TAMBAH_PESANAN);
        },
        child: const Icon(Icons.add, color: Colors.white, size: 35),
      ),
      drawer: Drawer(
        child: BackgroundWidget(
          child: ListView(
            children: [
              GestureDetector(
                // onTap:  () => Get.toNamed(Routes.MENU_RESTORAN),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: primaryAccent,
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: ListTile(
                    title: Row(
                      children: [
                        const Icon(
                          Icons.receipt_long_rounded,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Menu Restoran",
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
              ),
              GestureDetector(
                onTap:  () => Get.toNamed(Routes.REKAPAN_PEMESANAN),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: ListTile(
                    title: Row(
                      children: [
                        const Icon(
                          Icons.receipt_rounded,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Rekapan Pemesanan",
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
              ),
              GestureDetector(
                onTap:  () => Get.toNamed(Routes.TOP_ORDER),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: ListTile(
                    title: Row(
                      children: [
                        const Icon(
                          Icons.insert_chart_rounded,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Top Order",
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
              ),
              GestureDetector(
                onTap:  () => Get.toNamed(Routes.DAFTAR_HUTANG),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: ListTile(
                    title: Row(
                      children: [
                        const Icon(
                          Icons.price_check_rounded,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Daftar Hutang",
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: BackgroundWidget(
        child: GetBuilder<MenuRestoranController>(
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
                          Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Builder(
                                        builder: (BuildContext context) {
                                          return IconButton(
                                            icon: const Icon(Icons.menu, color: Colors.white),
                                            onPressed: () {
                                              Scaffold.of(context).openDrawer();
                                            },
                                            iconSize: 25,
                                          );
                                        },
                                      ),
                                      const SizedBox(width: 10,),
                                      Expanded(
                                        child: Text(
                                          "Menu Restoran",
                                          style: GoogleFonts.nunito(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      IconButton(
                                      icon: const Icon(Icons.logout_rounded, color: Colors.white),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => PopUpLogout());
                                      },
                                      iconSize: 25,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Divider(
                                    thickness: 1,
                                  )
                                ],
                              ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                Expanded(
                                    child: SizedBox(
                                      height: 60,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Cari Menu',
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
                                          color: grey,  // Set the color of the entered value to grey
                                        ),
                                      ),
                                    )

                                ),
                                const SizedBox(width: 10.0),
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: primaryAccent,
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
}


