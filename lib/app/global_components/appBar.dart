import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class appBar extends StatelessWidget {
  final String title;
  const appBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    iconSize: 24,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(width: 48),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                thickness: 1,
              )
            ],
          ),
        ],
      ),
    );
  }
}
