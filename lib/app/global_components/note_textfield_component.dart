import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';

class NotesTextfieldComponent extends StatelessWidget {
  final bool readOnly;
  final String hintText;

  const NotesTextfieldComponent({
    required this.readOnly,
    this.hintText = "",
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Notes",
          style: GoogleFonts.nunito(
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            readOnly: readOnly,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: white, fontWeight: FontWeight.normal, fontSize: 14),
              filled: true,
              fillColor: textFieldBackground,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Color(0xFF8DD5C0), width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Color(0xFF8DD5C0), width: 1.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}