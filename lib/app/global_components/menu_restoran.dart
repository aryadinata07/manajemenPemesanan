import 'package:angkringan_omaci_ta/app/global_components/popups/popup_hapus.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleOwner/menurestoran/menurestoran_controller.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:angkringan_omaci_ta/common/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuRestoranWidget extends StatelessWidget {
  final String name;
  final String category;
  final String price;
  final int productId;
  final int productCategoryId;

  const MenuRestoranWidget({
    super.key,
    required this.name,
    required this.category,
    required this.price,
    required this.productId,
    required this.productCategoryId,
  });

  @override
  Widget build(BuildContext context) {
    final MenuRestoranController controller = Get.find<MenuRestoranController>();
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: Card(
        color: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: Container(
                      // height: 97,
                      // width: 125,
                      // decoration: const BoxDecoration(
                      //   color: white,
                      //   borderRadius: BorderRadius.all(
                      //     Radius.circular(4),
                      //   ),
                      // ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 170,
                        child: Text(
                          name,
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: white,
                            ),
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        category,
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff7A7A7A),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        price,
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 40,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(46),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: PopupMenuButton<String>(
                  color: textFieldBackground,
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'edit',
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.edit, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            'Edit Menu',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.delete, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            'Delete Menu',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                  onSelected: (String value) {
                    switch (value) {
                      case 'edit':
                        Get.toNamed(
                          Routes.EDIT_MENU,
                          arguments: {
                            'name': name,
                            'category': category,
                            'price': price,
                            'productId': productId,
                            'productCategoryId': productCategoryId
                          },
                        );
                        break;
                      case 'delete':
                        showDialog(
                          context: context,
                          builder: (context) =>  PopUpHapus(
                            onDelete: () async {
                            await controller.deleteMenu(productId);
                            controller.getMenus();
                          },),
                        );
                        break;
                    }
                  },
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 5, bottom: 5),
                    child: Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
