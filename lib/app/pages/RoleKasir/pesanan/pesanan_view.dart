import 'package:angkringan_omaci_ta/app/global_components/background.dart';
import 'package:angkringan_omaci_ta/app/pages/index.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:angkringan_omaci_ta/common/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pesanan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PesananView extends StatelessWidget {
  const PesananView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {
          Get.toNamed(Routes.TAMBAH_PESANAN);
        },
        child: const Icon(Icons.add, color: Colors.white, size: 35),
      ),
      drawer: Drawer(
        child: BackgroundWidget(
          child: ListView(
            children: [
              GestureDetector(
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
                          "Pesanan",
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
        child: GetBuilder<PesananController>(
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
                                          "Pesanan",
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
                                        Get.offNamed(Routes.SIGN_IN);
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
