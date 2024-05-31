import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:angkringan_omaci_ta/app/global_components/add_remove_button.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';

class PesananItem extends StatelessWidget {
  final String namaMenu;
  final int jumlah;
  final String formattedHarga;
  final VoidCallback onDelete;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onTotalUpdated;

  const PesananItem({
    super.key,
    required this.namaMenu,
    required this.jumlah,
    required this.formattedHarga,
    required this.onDelete,
    required this.onQuantityChanged,
    required this.onTotalUpdated,
  });

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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
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
                            formattedHarga,
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
