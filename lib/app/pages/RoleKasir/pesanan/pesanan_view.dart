import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pesanan_controller.dart';
import 'package:angkringan_omaci_ta/app/global_components/appbar_kasir.dart';
import 'package:angkringan_omaci_ta/app/global_components/background.dart';
import 'package:angkringan_omaci_ta/app/global_components/pesanan_kasir.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:angkringan_omaci_ta/common/routes/app_pages.dart';

class PesananView extends StatelessWidget {
  const PesananView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {
          Get.toNamed(Routes.TAMBAH_PESANAN);
        },
        child: const Icon(Icons.add, color: Colors.white, size: 35),
      ),
      body: BackgroundWidget(
        child: GetBuilder<PesananController>(
          builder: (controller) {
            return SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAppBarKasir(context: context, title: "Pesanan"),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            height: 60,
                            child: TextField(
                              onChanged: (value) {
                                controller.searchOrders(value);
                              },
                              decoration: InputDecoration(
                                hintText: 'Cari Pesanan',
                                hintStyle: const TextStyle(
                                  color: grey,
                                ),
                                filled: true,
                                fillColor: textFieldBackground,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
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
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: Obx(
                            () {
                          if (controller.isLoading.value) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (controller.filteredOrders.isEmpty){
                            return const Center(
                            child: Text("Pesanan tidak ditemukan", style: TextStyle(color: white, fontSize: 20),),
                            );
                            } else {
                            return ListView.builder(
                              itemCount: controller.filteredOrders.length,
                              itemBuilder: (context, index) {
                                final order = controller.filteredOrders[index];
                                return PesananCard(
                                  nama: order.customerName,
                                  item: order.customerTotalProduct.toString(),
                                  totalPesanan: controller.formatPrice(order.customerTotalPrice),
                                  pembayaran: order.customerPayment ?? "Belum di bayar",
                                  tempatMakan: order.customerServe,
                                  orderId: order.customer,
                                );
                              },
                            );
                          }
                        },
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
