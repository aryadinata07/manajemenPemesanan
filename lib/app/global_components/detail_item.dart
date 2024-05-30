import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/helper/themes.dart';

class DetailItem extends StatelessWidget {
  final String namaMenu;
  final String harga;
  final String jumlah;

  const DetailItem({
    required this.namaMenu,
    required this.harga,
    required this.jumlah,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   height: 92,
              //   width: 92,
              //   decoration: const BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.all(
              //       Radius.circular(8),
              //     ),
              //   ),
              // ),
              // const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    namaMenu,
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    harga,
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffD17763),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "x $jumlah",
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: white,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(color: Color(0xffACACAC), thickness: 1),
      ],
    );
  }
}