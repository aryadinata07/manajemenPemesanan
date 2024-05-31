  import 'package:angkringan_omaci_ta/app/pages/index.dart';
  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:angkringan_omaci_ta/common/helper/themes.dart';
  import 'package:google_fonts/google_fonts.dart';
  import 'package:get/get.dart';
  import 'package:angkringan_omaci_ta/app/api/models/product_model.dart';

  class MenuItem extends StatelessWidget {
    final Menus menu;

    const MenuItem({
      super.key,
      required this.menu,
    });

    @override
    Widget build(BuildContext context) {
      final controller = Get.find<TambahPesananController>();
      print('Menu Quantity: ${menu.quantity}');

      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: textFieldBackground,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            menu.productName,
                            style: GoogleFonts.nunito(
                              color: white,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            menu.productCategory,
                            style: GoogleFonts.nunito(
                              color: grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            controller.formatPrice(menu.productPrice),
                            style: GoogleFonts.nunito(
                              color: white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Obx(() {
                  return GestureDetector(
                    onTap: () {
                      if (controller.isMenuSelected(menu)) {
                        controller.removeMenuFromSelected(menu);
                        Get.snackbar(
                          "Menu Dihapus",
                          "${menu.productName} telah dihapus",
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: red,
                          colorText: white,
                          duration: const Duration(seconds: 2),
                        );
                      } else {
                        controller.addMenuToSelected(menu);
                        menu.quantity = 1;
                        Get.snackbar(
                          "Menu Ditambahkan",
                          "${menu.productName} telah ditambahkan",
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: primaryAccent,
                          colorText: white,
                          duration: const Duration(seconds: 2),
                        );
                      }
                    },
                    child: Container(
                      width: 50,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: controller.isMenuSelected(menu) ? red : primaryAccent,
                      ),
                      child: Icon(
                        controller.isMenuSelected(menu) ? Icons.delete : Icons.add,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      );
    }
  }
