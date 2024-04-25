import 'package:flutter/material.dart';
import 'package:angkringan_omaci_ta/common/routes/app_pages.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class PopUpLogout extends StatelessWidget {
  const PopUpLogout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        height: 292,
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
                color: Color(0xffFEE4E2),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.logout_rounded, color: Color(0xffD92D20)),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Keluar',
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600, color: white),
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              'Apakah Anda yakin ingin keluar?\naksi ini tidak dapat di kembalikan',
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
                      MaterialStateProperty.all<Color>(const Color(0xffD92D20)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                onPressed: () {
                  Get.offNamed(Routes.SIGN_IN);
                },
                child: Text(
                  'Keluar',
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
                  'Batal',
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