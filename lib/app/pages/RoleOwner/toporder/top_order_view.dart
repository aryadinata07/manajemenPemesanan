import 'package:angkringan_omaci_ta/app/global_components/appbar_owner.dart';
import 'package:angkringan_omaci_ta/app/global_components/background.dart';
import 'package:angkringan_omaci_ta/app/global_components/sidebar/sidebar_view.dart';
import 'package:angkringan_omaci_ta/app/global_components/topOrder_menu.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleOwner/toporder/top_order_controller.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TopOrderView extends StatelessWidget {
  const TopOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingButton(),
      drawer: CustomDrawer(),
      body: BackgroundWidget(
        child: GetBuilder<TopOrderController>(
          builder: (controller) {
            return SafeArea(
              child: ListView(
                children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomAppBar(context: context, title: 'Top Order',),
                         Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: SizedBox(
                                      height: 60,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: '01 Mar - 10 Mar 2024',
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
                                              Icons.calendar_today,
                                              color: grey,
                                              size: 20,
                                            ),
                                            suffixIcon: IconButton(
                                              icon: const Icon(
                                                  Icons.expand_more_outlined),
                                              iconSize: 30,
                                              color: white,
                                              onPressed: () {},
                                            )),
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                const SizedBox(height: 10.0),
                                SizedBox(
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
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height - 200,
                              child: ListView.builder(
                                itemCount: controller.makanan.length,
                                itemBuilder: (context, index) {
                                  final menu = controller.makanan[index];
                                  return TopOrderWidget(
                                    name: menu['name']!,
                                    category: menu['category']!,
                                    price: menu['order']!,
                                  );
                                },
                              ),
                            ),
                          )
                        ],
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
