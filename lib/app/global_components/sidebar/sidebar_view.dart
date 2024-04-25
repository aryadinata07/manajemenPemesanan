import 'package:angkringan_omaci_ta/app/global_components/background.dart';
import 'package:angkringan_omaci_ta/app/global_components/sidebar/sidebar_controller.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:angkringan_omaci_ta/common/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatelessWidget {
  final SidebarController controller = Get.find();
  CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: background,
      backgroundColor: background,
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: ListTile(
              leading: const Icon(
                Icons.receipt_long_rounded,
                color: white,
              ),
              title: Text(
                "Menu Restoran",
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              tileColor: Colors.transparent,
              textColor: white,
              selectedColor: white,
              selectedTileColor: primaryAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              onTap: () {
                controller.onItemTapped(1);
                Get.offNamed(Routes.MENU_RESTORAN);
              },
              selected: controller.selectedItemIndex.value == 1,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: ListTile(
              leading: const Icon(
                Icons.receipt_rounded,
                color: white,
              ),
              title: Text(
                "Rekapan Pemesanan",
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              tileColor: Colors.transparent,
              textColor: white,
              selectedColor: white,
              selectedTileColor: primaryAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              onTap: () {
                controller.onItemTapped(2);
                Get.offNamed(Routes.REKAPAN_PEMESANAN);
              },
              selected: controller.selectedItemIndex.value == 2,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: ListTile(
              leading: const Icon(
                Icons.insert_chart_rounded,
                color: white,
              ),
              title: Text(
                "Top Order",
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              tileColor: Colors.transparent,
              textColor: white,
              selectedColor: white,
              selectedTileColor: primaryAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              onTap: () {
                controller.onItemTapped(3);
                Get.offNamed(Routes.TOP_ORDER);
              },
              selected: controller.selectedItemIndex.value == 3,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: ListTile(
              leading: const Icon(
                Icons.price_check_rounded,
                color: white,
              ),
              title: Text(
                "Daftar Hutang",
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              tileColor: Colors.transparent,
              textColor: white,
              selectedColor: white,
              selectedTileColor: primaryAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              onTap: () {
                controller.onItemTapped(4);
                Get.offNamed(Routes.DAFTAR_HUTANG);
              },
              selected: controller.selectedItemIndex.value == 4,
            ),
          ),
        ],
      ),
    );
  }
}