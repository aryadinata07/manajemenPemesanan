import 'package:angkringan_omaci_ta/app/global_components/appbar_owner.dart';
import 'package:angkringan_omaci_ta/app/global_components/background.dart';
import 'package:angkringan_omaci_ta/app/global_components/menu_restoran.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleOwner/menurestoran/menurestoran_controller.dart';
import 'package:angkringan_omaci_ta/app/global_components/sidebar/sidebar_view.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuRestoranView extends StatelessWidget {
  const MenuRestoranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingButton(),
      drawer: CustomDrawer(),
      body: BackgroundWidget(
        child: GetBuilder<MenuRestoranController>(
          builder: (controller) {
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomAppBar(
                            context: context,
                            title: 'Menu Restoran',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                Expanded(
                                    child: SizedBox(
                                  height: 60,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Cari Menu',
                                      hintStyle: const TextStyle(
                                        color: grey,
                                      ),
                                      filled: true,
                                      fillColor: textFieldBackground,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide.none,
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.search,
                                        color: grey,
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color: grey,
                                    ),
                                  ),
                                )),
                                const SizedBox(width: 10.0),
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: primaryAccent,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.filter_list,
                                      color: white,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height -
                                    200, // Sesuaikan tinggi ListView
                                child: ListView.builder(
                                  itemCount: controller.makanan.length,
                                  itemBuilder: (context, index) {
                                    final menu = controller.makanan[index];
                                    return MenuRestoranWidget(
                                      name: menu['name']!,
                                      category: menu['category']!,
                                      price: menu['price']!,
                                    );
                                  },
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  FloatingActionButton floatingButton() {
    return FloatingActionButton(
      backgroundColor: primaryAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      onPressed: () {
        // Get.toNamed(Routes.TAMBAH_PESANAN);
      },
      child: const Icon(Icons.add, color: Colors.white, size: 35),
    );
  }
}
