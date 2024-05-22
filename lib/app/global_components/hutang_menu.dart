import 'package:angkringan_omaci_ta/app/global_components/popups/popup_bayar.dart';
import 'package:angkringan_omaci_ta/app/global_components/popups/popup_hapus.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:angkringan_omaci_ta/common/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class HutangCard extends StatelessWidget {
  final String nama;
  final String jumlahPesnan;
  final String item;
  final String pembayaran;
  final String tempatMakan;
  final String totalPesanan;

  const HutangCard({
    Key? key,
    required this.nama,
    required this.pembayaran,
    required this.tempatMakan,
    required this.jumlahPesnan,
    required this.item,
    required this.totalPesanan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.HUTANG_DETAIL);
      },
      child: Container(
        width: double.infinity,
        height: 180,
        child: Stack(
          children: [
            Positioned.fill(
              child: Card(
                color: background,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nama,
                            style: GoogleFonts.nunito(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'Item ',
                                style: GoogleFonts.nunito(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff696969),
                                ),
                              ),
                              TextSpan(
                                text: item,
                                style: GoogleFonts.nunito(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              )
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 8),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.call,
                            color: white,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "0822239999898",
                            style: GoogleFonts.nunito(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    const Divider(),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.payment,
                            color: Color(0xffACACAC),
                            size: 12,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Hutang | Makan di tempat",
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
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
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 5, right: 4),
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
                        value: 'tunai',
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.payments_outlined, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              'Tunai',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: 'qris',
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.qr_code_2, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              'Qris',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                    onSelected: (String value) {
                      switch (value) {
                        case 'tunai':
                          showDialog(
                            context: context,
                            builder: (context) => PopUpBayar(
                              paymentMethod: "Tunai",
                              onFinish: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          );
                          break;
                        case 'qris':
                          showDialog(
                            context: context,
                            builder: (context) => PopUpBayar(
                              paymentMethod: "Qris",
                              onFinish: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          );
                          break;
                      }
                    },
                    icon: const Padding(
                      padding: EdgeInsets.only(left: 5, bottom: 5),
                      child: Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
