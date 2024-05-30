import 'package:angkringan_omaci_ta/app/global_components/appbar.dart';
import 'package:angkringan_omaci_ta/app/global_components/background.dart';
import 'package:angkringan_omaci_ta/app/global_components/detail_item.dart';
import 'package:angkringan_omaci_ta/app/global_components/note_textfield_component.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleKasir/detailpesanan/detail_controller.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailView extends StatelessWidget {
  final int orderId;

  const DetailView({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    final DetailController controller = Get.put(DetailController());

    // Fetch order details by orderId

    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Column(
            children: [
              const AppbarView(title: "Detail Pesanan"),
              Expanded(
                child: GetBuilder<DetailController>(
                  builder: (controller) {
                    return Obx(() {
                      if (controller.isLoading.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }else if (controller.filteredOrders.isEmpty) {
                        return const Center(
                          child: Text("No order found"),
                        );
                      }
                      else{
                        controller.getOrderById(orderId);
                        final order = controller.filteredOrders.first;
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 22),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          color: background,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 10, left: 10, bottom: 5),
                                              child: Row(
                                                children: [
                                                  const Icon(Icons.person_2_outlined, color: white, size: 15),
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Nama Pelanggan: ',
                                                          style: GoogleFonts.nunito(
                                                            fontSize: 10,
                                                            fontWeight: FontWeight.w400,
                                                            color: white,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: order.customerName,
                                                          style: GoogleFonts.nunito(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w700,
                                                            color: white,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const Divider(),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 10),
                                              child: Column(
                                                children: order.products.map<Widget>((item) {
                                                  return DetailItem(
                                                    namaMenu: item.productName,
                                                    harga: controller.formatPrice(item.basePrice),
                                                    jumlah: item.quantity.toString(),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    order.customerServe,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment: Alignment.centerRight,
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: 'Total pesanan: ',
                                                              style: GoogleFonts.nunito(
                                                                fontSize: 10,
                                                                fontWeight: FontWeight.w400,
                                                                color: Colors.white,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: controller.formatPrice(order.customerTotalPrice),
                                                              style: GoogleFonts.nunito(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w700,
                                                                color: const Color(0xffD17763),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      NotesTextfieldComponent(
                                        readOnly: true,
                                        hintText: order.customerNotes ?? "",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        );
                      }
                    },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
