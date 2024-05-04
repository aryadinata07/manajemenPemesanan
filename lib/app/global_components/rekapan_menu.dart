import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RekapanCard extends StatelessWidget {
  final String nama;
  final String kodePesanan;
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
    required this.kodePesanan,
    required this.totalPesanan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      child: Card(
        color: Colors.grey[800],
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
                          children: [
                            Text(
                              "Lihat detail",
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xffACACAC),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Color(0xffACACAC),
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kode pesanan:",
                                  style: GoogleFonts.poppins(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Container(
                                  width: 70,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      kodePesanan,
                                      style: GoogleFonts.nunito(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xff383838),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            // aa
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.payment,
                    color: const Color(0xffACACAC),
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
    );
  }
}
