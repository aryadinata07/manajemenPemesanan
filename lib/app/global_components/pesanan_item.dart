import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:angkringan_omaci_ta/app/global_components/add_remove_button.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';

class PesananItem extends StatelessWidget {
  final String namaMenu;
  final int harga;
  final int jumlah;
  final String formattedHarga;
  final VoidCallback onDelete;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onTotalUpdated; // Add the onTotalUpdated parameter

  const PesananItem({
    Key? key,
    required this.namaMenu,
    required this.harga,
    required this.jumlah,
    required this.formattedHarga,
    required this.onDelete,
    required this.onQuantityChanged,
    required this.onTotalUpdated, // Ensure it is required here too
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 92,
                      width: 92,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          namaMenu,
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Rp $formattedHarga",
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffD17763),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: onDelete,
                      child: const Icon(
                        Icons.close,
                        color: Color(0xff696969),
                        size: 18,
                      ),
                    )
                  ],
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: AddButton(
                    initialValue: jumlah,
                    onQuantityChanged: onQuantityChanged,
                    onTotalUpdated: onTotalUpdated, // Pass the onTotalUpdated callback
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          color: Color(0xffACACAC),
          thickness: 1,
        ),
      ],
    );
  }
}
