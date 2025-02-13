import 'package:flutter/material.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:google_fonts/google_fonts.dart';

class PopUpSelesai extends StatelessWidget {
  const PopUpSelesai({super.key});

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
              child: const Icon(Icons.check_circle_outline,
                  color: Color(0xff00DE31)),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Selesaikan Pesanan',
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600, color: white),
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              'Apakah anda yakin untuk menyelesaikan\npesanan ini?',
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
                      MaterialStateProperty.all<Color>(const Color(0xff20A535)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Ya, Selesaikan',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: double.infinity, // Membuat tombol memenuhi lebar container
              height: 44.0,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Tidak',
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
