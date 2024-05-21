import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:angkringan_omaci_ta/common/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RekapanCard extends StatelessWidget {
  final String nama;
  final String jumlahPesnan;
  final String item;
  final String pembayaran;
  final String tempatMakan;
  final String totalPesanan;

  const RekapanCard({
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
        Get.toNamed(Routes.DETAIL);
      },
      child: Container(
        width: double.infinity,
        height: 180,
        child: Card(
          color: background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
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
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              const Divider(),
              // aa
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Row(
                  children: [
                    pembayaran == 'Tunai'
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
                      // metode pmbayaran | tempatMakan
                      "$pembayaran | $tempatMakan",
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
    );
  }
}
