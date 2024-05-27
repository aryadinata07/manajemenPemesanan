import 'package:angkringan_omaci_ta/app/global_components/add_remove_button.dart';
import 'package:angkringan_omaci_ta/app/global_components/appbar.dart';
import 'package:angkringan_omaci_ta/app/global_components/note_textfield_component.dart';
import 'package:angkringan_omaci_ta/app/global_components/pesanan_item.dart';
import 'package:angkringan_omaci_ta/app/global_components/popups/popup_bayar.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleKasir/nota/nota_controller.dart';
import 'package:angkringan_omaci_ta/common/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:angkringan_omaci_ta/app/global_components/background.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:google_fonts/google_fonts.dart';


class NotaView extends StatelessWidget {
  const NotaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotaController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundWidget(
        child: GetBuilder<NotaController>(
          builder: (controller) {
            return SafeArea(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [AppbarView(title: "Nota")],
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
                                              top: 10, left: 10, bottom: 5),
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.person_2_outlined,
                                                color: white,
                                                size: 15,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                    text: 'Nama Pelanggan: ',
                                                    style: GoogleFonts.nunito(
                                                      fontSize: 10,
                                                      fontWeight:
                                                      FontWeight.w400,
                                                      color: white,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: " Tasya",
                                                    style: GoogleFonts.nunito(
                                                      fontSize: 12,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      color: white,
                                                    ),
                                                  )
                                                ]),
                                              )
                                            ],
                                          ),
                                        ),
                                        const Divider(),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          // Component baru mulai dari sini
                                          child: Column(
                                            children: controller.pesanan
                                                .map((item) {
                                              int index = controller.pesanan
                                                  .indexOf(item);
                                              return PesananItem(
                                                namaMenu:
                                                item['namaMenu'] as String,
                                                harga: int.parse(
                                                    item['harga'] as String),
                                                jumlah: item['item'] as int,
                                                formattedHarga: controller
                                                    .formatCurrency(
                                                    int.parse(item[
                                                    'harga'] as String)),
                                                onDelete: () {
                                                  controller.pesanan.removeAt(
                                                      index);
                                                  controller.hitungTotalHarga();
                                                  controller.update();
                                                },
                                                onQuantityChanged:
                                                    (quantity) {
                                                  controller.updateItemQuantity(
                                                      index, quantity);
                                                },
                                                onTotalUpdated: () {
                                                  controller.hitungTotalHarga();
                                                },
                                              );
                                            }).toList(),
                                            // batas akhir component baru
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10, left: 10, bottom: 10),
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
                                                            color: const Color(
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
                            const SizedBox(height: 10),
                            const NotesTextfieldComponent(
                              readOnly: true,
                              hintText: "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(top: 50, bottom: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Metode Pembayaran',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: white,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  SizedBox(
                                    height: 50,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: primaryAccent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.toNamed(Routes.HUTANG);
                                      },
                                      child: const Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.receipt_long,
                                            color: white,
                                            size: 20,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            'Hutang',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    height: 50,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: primaryAccent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => PopUpBayar(
                                            paymentMethod: "Tunai",
                                            onFinish: () {
                                              Get.offAllNamed(Routes.PESANAN);
                                            },
                                          ),
                                        );
                                      },
                                      child: const Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.payments,
                                            color: white,
                                            size: 20,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            'Tunai',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    height: 50,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: primaryAccent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => PopUpBayar(
                                            paymentMethod: "Qris",
                                            onFinish: () {
                                              Get.offAllNamed(Routes.PESANAN);
                                            },
                                          ),
                                        );
                                      },
                                      child: const Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.qr_code_2,
                                            color: white,
                                            size: 20,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            'QRIS',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
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