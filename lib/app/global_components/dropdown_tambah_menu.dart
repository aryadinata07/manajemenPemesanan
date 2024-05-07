import 'package:flutter/material.dart';

class DropdownTambahMenu extends StatefulWidget {
  @override
  _DropdownTambahMenuState createState() => _DropdownTambahMenuState();
}

class _DropdownTambahMenuState extends State<DropdownTambahMenu> {
  String _selectedCategory = '--- Pilih Kategori Menu ---';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49,
      child: DropdownButtonFormField<String>(
        value: _selectedCategory,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Color(0xFF8DD5C0), width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Color(0xFF8DD5C0), width: 1.0),
          ),
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down_sharp,
            size: 30,
          ),
        ),
        style: TextStyle(color: Colors.grey),
        items: <String>[
          '--- Pilih Kategori Menu ---',
          'Makanan',
          'Minuman',
          'Snack',
        ].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            _selectedCategory = value!;
          });
        },
      ),
    );
  }
}
