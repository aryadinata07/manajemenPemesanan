import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddButton extends StatefulWidget {
  final int initialValue;
  final Function(int) onQuantityChanged;
  final VoidCallback onTotalUpdated;

  const AddButton({
    Key? key,
    required this.initialValue,
    required this.onQuantityChanged,
    required this.onTotalUpdated,
  }) : super(key: key);

  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  late int itemValue;

  @override
  void initState() {
    super.initState();
    itemValue = widget.initialValue;
  }

  void _increment() {
    setState(() {
      itemValue++;
    });
    widget.onQuantityChanged(itemValue);
    widget.onTotalUpdated();
  }

  void _decrement() {
    setState(() {
      if (itemValue > 0) {
        itemValue--;
      }
    });
    widget.onQuantityChanged(itemValue);
    widget.onTotalUpdated();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _decrement,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.white,
                width: 1.0,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.remove,
                color: Colors.white,
                size: 10,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "$itemValue",
            style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: _increment,
          child: Container(
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
              color: Color(0xFF5BA48F),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
