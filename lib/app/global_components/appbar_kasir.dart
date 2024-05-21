import 'package:angkringan_omaci_ta/app/global_components/popups/popup_signout/popup_signout_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBarKasir extends StatelessWidget {
  final BuildContext context;
  final String title;

  const CustomAppBarKasir({super.key, required this.context, required this.title, });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.logout_rounded, color: Colors.white),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => PopUpSignOutView(),
                );
              },
              iconSize: 25,
            )
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
