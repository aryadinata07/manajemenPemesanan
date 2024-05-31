import 'package:angkringan_omaci_ta/app/global_components/add_remove_button.dart';
import 'package:angkringan_omaci_ta/app/global_components/appbar.dart';
import 'package:angkringan_omaci_ta/app/global_components/note_textfield_component.dart';
import 'package:angkringan_omaci_ta/app/global_components/pesanan_item.dart';
import 'package:angkringan_omaci_ta/app/pages/index.dart';
import 'package:angkringan_omaci_ta/common/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:angkringan_omaci_ta/app/global_components/background.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleKasir/keranjang/keranjang_controller.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:google_fonts/google_fonts.dart';

class KeranjangView extends StatelessWidget {
  const KeranjangView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(KeranjangController());
    final tambahPesananController = Get.find<TambahPesananController>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundWidget(
        child: GetBuilder<KeranjangController>(
          builder: (controller) {
            return SafeArea(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [AppbarView(title: "Keranjang")],
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
                                    height: 5,
                                  ),
                                  TextField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(
                                          controller.maxLength),
                                    ],
                                    onChanged: controller.updateText,
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
                                            color: primaryAccent, width: 1.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: const BorderSide(
                                            color: primaryAccent, width: 1.0),
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color: white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Obx(() => Text(
                                        '${controller.currentText.value.length} / ${controller.maxLength}',
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      )),
                                  const SizedBox(
                                    height: 10,
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
                                    height: 5,
                                  ),
                                  Container(
                                    height: 60,
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
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            dropdownColor: textFieldBackground,
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                            value: controller.setCategory.value
                                                    .isNotEmpty
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
                                                      color: white),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const NotesTextfieldComponent(
                                    readOnly: false,
                                    hintText:
                                        "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
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
                                            children: tambahPesananController
                                                .selectedMenus
                                                .map((menu) {
                                              return PesananItem(
                                                namaMenu: menu.productName,
                                                jumlah: menu.quantity,
                                                formattedHarga:
                                                    controller.formatPrice(
                                                        menu.productPrice),
                                                onDelete: () {
                                                  tambahPesananController
                                                      .removeMenuFromSelected(
                                                          menu);
                                                },
                                                onQuantityChanged:
                                                    (quantity) {},
                                                onTotalUpdated: () {},
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                        const Padding(
                                          padding:  EdgeInsets.only(
                                              right: 10, bottom: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                               Text(
                                                "Total Pesanan: ",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(width: 7,),
                                          Text(
                                                "20.000",
                                                style:  TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xffD17763),
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onPressed: () {
                              Get.offAllNamed(Routes.PESANAN);
                            },
                            child: const Text(
                              'Tambah Pesanan',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: white,
                              ),
                            ),
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
