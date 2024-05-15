import 'package:angkringan_omaci_ta/app/global_components/add_remove_button.dart';
import 'package:angkringan_omaci_ta/common/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:angkringan_omaci_ta/app/global_components/appbar_back.dart';
import 'package:angkringan_omaci_ta/app/global_components/background.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleKasir/keranjang/keranjang_controller.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:google_fonts/google_fonts.dart';

class KeranjangView extends StatelessWidget {
  const KeranjangView({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(KeranjangController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundWidget(
        child: GetBuilder<KeranjangController>(
          builder: (controller) {
            return SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppbarBack(
                          context: context,
                          title: "Keranjang",
                          goTo: Routes.TAMBAH_PESANAN,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
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
                                        hintText: 'Nama pelanggan',
                                        hintStyle: const TextStyle(
                                            color: grey, fontSize: 14),
                                        filled: true,
                                        fillColor: textFieldBackground,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xFF8DD5C0),
                                              width: 1.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xFF8DD5C0),
                                              width: 1.0),
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
                                    "Tipe Penyajian",
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
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: textFieldBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: primaryAccent,
                                        width: 1,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: DropdownButton<String>(
                                          dropdownColor: textFieldBackground,
                                          borderRadius:
                                              BorderRadius.circular(9.0),
                                          value: controller
                                                  .setCategory.value.isNotEmpty
                                              ? controller.setCategory.value
                                              : 'Bungkus',
                                          onChanged: (String? newValue) {
                                            if (newValue != null) {
                                              controller.setSelectedCategory(
                                                  newValue);
                                              controller.update();
                                            }
                                          },
                                          underline: const SizedBox(),
                                          style: const TextStyle(
                                              color: white, fontSize: 14),
                                          isExpanded: true,
                                          items: <String>[
                                            'Bungkus',
                                            'Makan ditempat',
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: const TextStyle(
                                                    color: grey),
                                              ),
                                            );
                                          }).toList(),
                                        ),
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
                                        hintText: 'Masukan notes',
                                        hintStyle: const TextStyle(
                                            color: grey, fontSize: 14),
                                        filled: true,
                                        fillColor: textFieldBackground,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xFF8DD5C0),
                                              width: 1.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xFF8DD5C0),
                                              width: 1.0),
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
                                              int index = controller.pesanan
                                                  .indexOf(item);
                                              return Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 10),
                                                    child: Container(
                                                      child: Stack(
                                                        children: [
                                                          Row(
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
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                            8),
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
                                                                    item['namaMenu']
                                                                        as String,
                                                                    style: GoogleFonts
                                                                        .nunito(
                                                                      textStyle:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                        color:
                                                                            white,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 4,
                                                                  ),
                                                                  Text(
                                                                    "Rp ${controller.formatCurrency(int.parse(item['harga'] as String))}",
                                                                    style: GoogleFonts
                                                                        .nunito(
                                                                      textStyle:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                        color: Color(
                                                                            0xffD17763),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const Spacer(),
                                                              GestureDetector(
                                                                child:
                                                                    const Icon(
                                                                  Icons.close,
                                                                  color: Color(
                                                                      0xff696969),
                                                                  size: 18,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Positioned(
                                                            bottom: 0,
                                                            right: 0,
                                                            child: AddButton(
                                                              initialValue:
                                                                  item['item']
                                                                      as int,
                                                              onQuantityChanged:
                                                                  (quantity) {
                                                                controller
                                                                    .updateItemQuantity(
                                                                        index,
                                                                        quantity);
                                                              },
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
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Obx(() {
                                                    return RichText(
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                          text:
                                                              'Total pesanan: ',
                                                          style: GoogleFonts
                                                              .nunito(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              "Rp ${controller.formatCurrency(controller.totalHarga.value)}",
                                                          style: GoogleFonts
                                                              .nunito(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Color(
                                                                0xffD17763),
                                                          ),
                                                        )
                                                      ]),
                                                    );
                                                  }),
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Lanjut',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: white,
                          ),
                        ),
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
