import 'package:flutter/material.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:google_fonts/google_fonts.dart';

class PopUpBayar extends StatelessWidget {
  final String paymentMethod;
  final VoidCallback onFinish;

  const PopUpBayar(
      {super.key, required this.paymentMethod, required this.onFinish});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        width: 345,
        decoration: BoxDecoration(
          color: textFieldBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: const EdgeInsets.all(17.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xffFE2FEE8),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Color(0xff00DE31)),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Konfirmasi',
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600, color: white),
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              'Apakah pembayaran menggunakan $paymentMethod\nsudah selesai?',
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: white,
                  )),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xff5BA48F)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                onPressed: () {
                  onFinish();
                },
                child: Text(
                  'Selesai',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
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