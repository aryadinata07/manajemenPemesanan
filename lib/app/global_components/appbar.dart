import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppbarView extends StatelessWidget {
  final String title;
  const AppbarView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
               Get.back();
              },
              iconSize: 25,
            ),
            const SizedBox(width: 10,),
            Text(
              title,
              style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1,
        )
      ],
    );
  }
}
