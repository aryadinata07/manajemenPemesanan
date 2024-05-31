import 'package:angkringan_omaci_ta/app/global_components/appbar.dart';
import 'package:angkringan_omaci_ta/app/pages/index.dart';
import 'package:angkringan_omaci_ta/common/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:angkringan_omaci_ta/app/global_components/background.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:angkringan_omaci_ta/app/global_components/menu_item.dart';

class TambahPesananView extends StatelessWidget {
  const TambahPesananView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: GetBuilder<TambahPesananController>(
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
                          const AppbarView(title: "Tambah Pesanan"),
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
                                      onChanged: (value) {
                                        controller.searchMenus(value);
                                      },
                                    ),
                                  ),
                                ),
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
                          const SizedBox(height: 20),
                          Expanded(
                            child: Obx(
                              () {
                                if (controller.isLoading.value) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (controller.filteredMenus.isEmpty) {
                                  return const Center(
                                    child: Text(
                                      "Menu tidak ditemukan",
                                      style:
                                          TextStyle(color: white, fontSize: 20),
                                    ),
                                  );
                                } else {
                                  return ListView.builder(
                                    itemCount: controller.filteredMenus.length,
                                    itemBuilder: (context, index) {
                                      final menu =
                                          controller.filteredMenus[index];
                                      return MenuItem(
                                        menu: menu,
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {
                          if (controller.selectedMenus.isEmpty) {
                            Get.snackbar(
                              "Tidak ada menu yang di pilih",
                              "Silahkan tambahkan menu",
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: red,
                              colorText: white,
                              duration: const Duration(seconds: 2),
                            );
                          } else {
                            Get.toNamed(Routes.KERANJANG);
                          }
                        },
                        child: const Text(
                          'Lanjut',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: white,
                          ),
                        ),
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
}
