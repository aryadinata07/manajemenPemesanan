// pesanan_view.dart

import 'package:angkringan_omaci_ta/app/global_components/appbar_owner_back.dart';
import 'package:angkringan_omaci_ta/app/global_components/background.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleOwner/detailpesanan/detail_pesanan_controller.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:angkringan_omaci_ta/common/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HutangDetailView extends StatelessWidget {
  const HutangDetailView({Key? key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailPesananController());

    return Scaffold(
      body: BackgroundWidget(
        child: GetBuilder<DetailPesananController>(
          builder: (controller) {
            return SafeArea(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppbarBack(
                          context: context,
                          title: "Detail Pesanan",
                          goTo: Routes.MENU_RESTORAN,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 23),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nama Pelanggan",
                                style: GoogleFonts.nunito(
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              SizedBox(
                                height: 49,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Detail Pesanan',
                                    hintStyle: const TextStyle(
                                        color: grey, fontSize: 14),
                                    filled: true,
                                    fillColor: textFieldBackground,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF8DD5C0), width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF8DD5C0), width: 1.0),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    color: grey,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Nomor Pelanggan",
                                style: GoogleFonts.nunito(
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              SizedBox(
                                height: 49,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Nomor Pelanggan',
                                    hintStyle: const TextStyle(
                                        color: grey, fontSize: 14),
                                    filled: true,
                                    fillColor: textFieldBackground,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF8DD5C0), width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF8DD5C0), width: 1.0),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    color: grey,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Notes",
                                style: GoogleFonts.nunito(
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              SizedBox(
                                height: 49,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Notes',
                                    hintStyle: const TextStyle(
                                        color: grey, fontSize: 14),
                                    filled: true,
                                    fillColor: textFieldBackground,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF8DD5C0), width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF8DD5C0), width: 1.0),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    color: grey,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: background,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 10, right: 10),
                                      child: Column(
                                        children:
                                            controller.pesanan.map((item) {
                                          return Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                child: Container(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        height: 92,
                                                        width: 92,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: white,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(8),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            item['namaMenu']!,
                                                            style: GoogleFonts
                                                                .nunito(
                                                              textStyle:
                                                                  const TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: white,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 4,
                                                          ),
                                                          Text(
                                                            item['harga']!,
                                                            style: GoogleFonts
                                                                .nunito(
                                                              textStyle:
                                                                  const TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Color(
                                                                    0xffD17763),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                      Text(
                                                        "x ${item['jumlah']}",
                                                        style:
                                                            GoogleFonts.nunito(
                                                          textStyle:
                                                              const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: white,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const Divider(
                                                color: Color(0xffACACAC),
                                                thickness: 1,
                                              ),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, left: 10, bottom: 10),
                                      child: Row(
                                        children: [
                                          "Tunai" == 'Tunai'
                                              ? const Icon(
                                                  Icons.payment,
                                                  color: Color(0xffACACAC),
                                                  size: 12,
                                                )
                                              : const Icon(
                                                  Icons.qr_code,
                                                  color: Color(0xffACACAC),
                                                  size: 12,
                                                ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            "Tunai | Makan di tempat",
                                            style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                    text: 'Total pesanan: ',
                                                    style: GoogleFonts.nunito(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "Rp 53.000",
                                                    style: GoogleFonts.nunito(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color(0xffD17763),
                                                    ),
                                                  )
                                                ]),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
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
