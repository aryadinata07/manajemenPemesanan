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
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: [
            buildListTile(
              icon: Icons.receipt_long_rounded,
              title: "Menu Restoran",
              onTap: () {
                controller.onItemTapped(1);
                Get.offNamed(Routes.MENU_RESTORAN);
              },
              isSelected: controller.selectedItemIndex.value == 1,
            ),
            buildListTile(
              icon: Icons.receipt_rounded,
              title: "Rekapan Pemesanan",
              onTap: () {
                controller.onItemTapped(2);
                Get.offNamed(Routes.REKAPAN_PEMESANAN);
              },
              isSelected: controller.selectedItemIndex.value == 2,
            ),
            buildListTile(
              icon: Icons.insert_chart_rounded,
              title: "Top Order",
              onTap: () {
                controller.onItemTapped(3);
                Get.offNamed(Routes.TOP_ORDER);
              },
              isSelected: controller.selectedItemIndex.value == 3,
            ),
            buildListTile(
              icon: Icons.price_check_rounded,
              title: "Daftar Hutang",
              onTap: () {
                controller.onItemTapped(4);
                Get.offNamed(Routes.DAFTAR_HUTANG);
              },
              isSelected: controller.selectedItemIndex.value == 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required bool isSelected,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? primaryAccent : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: Icon(
            icon,
            color: isSelected ? white : Colors.white.withOpacity(0.6),
          ),
          title: Text(
            title,
            style: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: isSelected ? white : Colors.white.withOpacity(0.6),
            ),
          ),
        ),
      ),
    );
  }
}
