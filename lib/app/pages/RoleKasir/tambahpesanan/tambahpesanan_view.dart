import 'package:angkringan_omaci_ta/app/global_components/appbar_back.dart';
import 'package:angkringan_omaci_ta/common/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'tambahpesanan_controller.dart';
import 'package:angkringan_omaci_ta/app/global_components/appbar.dart';
import 'package:angkringan_omaci_ta/app/global_components/background.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:angkringan_omaci_ta/app/global_components/menu_item.dart';

class TambahPesananView extends StatelessWidget {
  const TambahPesananView({super.key});
  // final TambahPesananController controller = Get.put(TambahPesananController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_rounded),
      //     color: white,
      //     iconSize: 25,
      //     onPressed: () {
      //       // Add your notifications functionality here
      //       print('Notifications button clicked');
      //     },
      //   ),
      //   title: Text(
      //     "Tambah Pesanan",
      //     style: GoogleFonts.nunito(
      //       color: Colors.white,
      //       fontSize: 20,
      //       fontWeight: FontWeight.w800,
      //     ),
      //     textAlign: TextAlign.center,
      //   ),
      //   backgroundColor: primaryAccent,
      // ),
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
                          AppbarBack(
                            context: context,
                            title: "Tambah Pesanan",
                            goTo: Routes.PESANAN,
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
                                      color:
                                          grey, // Set the color of the entered value to grey
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
                          const SizedBox(height: 20),
                          Expanded(
                            child: ListView.builder(
                              itemCount: controller.foods.length,
                              itemBuilder: (context, index) {
                                final food = controller.foods[index];
                                return MenuItem(
                                  foodName: food['name']!,
                                  foodCategory: food['category']!,
                                  foodPrice: food['price']!,
                                );
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
                          Get.offNamed(Routes.KERANJANG);
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
