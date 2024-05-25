import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';

class CustomTextField extends StatelessWidget {
  final int maxLength;
  final ValueChanged<String>? onChanged;


  const CustomTextField({
    Key? key,
    required this.maxLength,
    this.onChanged,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
      ],
      onChanged: onChanged,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: grey, fontSize: 14),
        filled: true,
        fillColor: textFieldBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: primaryAccent, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: primaryAccent, width: 1.0),
        ),
      ),
      style: TextStyle(color: white),
    );
  }
}
