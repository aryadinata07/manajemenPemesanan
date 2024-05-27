import 'package:angkringan_omaci_ta/app/global_components/appbar.dart';
import 'package:angkringan_omaci_ta/app/global_components/background.dart';
import 'package:angkringan_omaci_ta/app/global_components/detail_item.dart';
import 'package:angkringan_omaci_ta/app/global_components/note_textfield_component.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleKasir/detailpesanan/detail_controller.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailController());

    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Column(
            children: [
              const AppbarView(title: "Detail Pesanan"),
              Expanded(
                child: GetBuilder<DetailController>(
                  builder: (controller) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 22),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: background,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10, left: 10, bottom: 5),
                                          child: Row(
                                            children: [
                                              const Icon(Icons.person_2_outlined, color: white, size: 15),
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Nama Pelanggan: ',
                                                      style: GoogleFonts.nunito(
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.w400,
                                                        color: white,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: " Tasya",
                                                      style: GoogleFonts.nunito(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w700,
                                                        color: white,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const Divider(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Column(
                                            children: controller.pesanan.map<Widget>((item) {
                                              return DetailItem(
                                                namaMenu: item['namaMenu']!,
                                                harga: item['harga']!,
                                                jumlah: item['jumlah']!,
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Makan di tempat",
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
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Total pesanan: ',
                                                          style: GoogleFonts.nunito(
                                                            fontSize: 10,
                                                            fontWeight: FontWeight.w400,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: "Rp 53.000",
                                                          style: GoogleFonts.nunito(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w700,
                                                            color: const Color(0xffD17763),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const NotesTextfieldComponent(
                                    readOnly: true,
                                    hintText: "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
                                  ),
                              ]
                            )
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}