import 'package:angkringan_omaci_ta/app/global_components/popups/popup_batal.dart';
import 'package:angkringan_omaci_ta/app/global_components/popups/popup_selesai.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleKasir/detailpesanan/detail_view.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:angkringan_omaci_ta/common/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PesananCard extends StatelessWidget {
  final String nama;
  final String item;
  final String pembayaran;
  final String tempatMakan;
  final String totalPesanan;
  final int orderId;

  const PesananCard({
    super.key,
    required this.nama,
    required this.pembayaran,
    required this.tempatMakan,
    required this.item,
    required this.totalPesanan,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DetailView(orderId: orderId));
      },
      child: SizedBox(
        width: double.infinity,
        height: 180,
        child: Card(
          color: background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 300,
                              child: Text(
                                nama,
                                style: GoogleFonts.nunito(
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: white,
                                  ),
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'Item ',
                              style: GoogleFonts.nunito(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff696969),
                              ),
                            ),
                            TextSpan(
                              text: item,
                              style: GoogleFonts.nunito(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          "$pembayaran |",
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          " $tempatMakan",
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
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: totalPesanan,
                                  style: GoogleFonts.nunito(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xffD17763),
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
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 40,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(46),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: PopupMenuButton<String>(
                    color: textFieldBackground,
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'edit',
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.edit, color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Edit Pesanan',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: 'bayar',
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.payments_outlined, color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Bayar Pesanan',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: 'selesai',
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.check, color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Selesaikan Pesanan',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: 'batal',
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.close, color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Batalkan Pesanan',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                    onSelected: (String value) {
                      switch (value) {
                        case 'edit':
                          Get.toNamed(Routes.TAMBAH_PESANAN);
                          break;
                        case 'bayar':
                          Get.toNamed(Routes.NOTA);
                          break;
                        case 'selesai':
                          showDialog(
                            context: context,
                            builder: (context) => const PopUpSelesai(),
                          );
                          break;
                        case 'batal':
                          showDialog(
                            context: context,
                            builder: (context) => const PopUpBatal(),
                          );
                          break;
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 5, bottom: 5),
                      child: Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
