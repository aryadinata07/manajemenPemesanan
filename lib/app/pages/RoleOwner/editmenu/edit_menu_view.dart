import 'package:angkringan_omaci_ta/app/api/models/category_model.dart';
import 'package:angkringan_omaci_ta/app/global_components/appbar.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleOwner/editmenu/edit_menu_controller.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleOwner/menurestoran/menurestoran_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:angkringan_omaci_ta/app/global_components/background.dart';

class EditMenuView extends StatelessWidget {
  const EditMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final EditMenuController controller = Get.put(EditMenuController());

    final Map<String, dynamic> args = Get.arguments as Map<String, dynamic>;
    final String name = args['name'];
    final String category = args['category'];
    final String price = args['price'];
    final int productId = args['productId'];
    final int productCategoryId = args['productCategoryId'];

    controller.nama.text = name;
    controller.harga.text = controller.extractDigits(price);
    controller.selectedCategory.value.id = productCategoryId;
    controller.currentText = name.obs;

    final TextEditingController textController = TextEditingController(text: name);

    textController.addListener(() {
      controller.updateText(textController.text);
    });

    return Scaffold(
      body: BackgroundWidget(
        child: GetBuilder<EditMenuController>(
          builder: (controller) {
            return SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppbarView(title: "Edit Menu"),
                        Obx(() {
                          if (controller.isLoading.value) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 22),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kategori Menu",
                                  style: GoogleFonts.nunito(
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: textFieldBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: primaryAccent,
                                      width: 1,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Obx(() =>
                                          DropdownButton<String>(
                                            dropdownColor: textFieldBackground,
                                            borderRadius: BorderRadius.circular(9.0),
                                            value: controller.selectedCategory.value.name.isEmpty
                                                ? controller.selectedCategory.value.name = category
                                                : controller.selectedCategory.value.name,
                                            onChanged: (String? newValue) {
                                              if (newValue != null) {
                                                var selectedCategory = controller.categories.firstWhere(
                                                      (category) => category.categoryName == newValue,
                                                  orElse: () => Categories(categoryId: 1, categoryName: "Makanan"),
                                                );
                                                controller.setSelectedCategory(selectedCategory);
                                              }
                                            },
                                            underline: const SizedBox(),
                                            style: const TextStyle(color: white, fontSize: 16),
                                            isExpanded: true,
                                            items: controller.categories.map<DropdownMenuItem<String>>((category) {
                                              return DropdownMenuItem<String>(
                                                value: category.categoryName,
                                                child: Text(
                                                  category.categoryName,
                                                  style: const TextStyle(color: white),
                                                ),
                                              );
                                            }).toList(),
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Nama Menu",
                                  style: GoogleFonts.nunito(
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Obx(() => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      controller: controller.nama,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(controller.maxLength),
                                      ],
                                      onChanged: controller.updateText,
                                      decoration: InputDecoration(
                                        hintStyle: const TextStyle(color: grey, fontSize: 14),
                                        filled: true,
                                        fillColor: textFieldBackground,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              color: controller.isNameEmpty.value
                                                  ? Colors.red
                                                  : primaryAccent,
                                              width: 1.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              color: controller.isNameEmpty.value
                                                  ? Colors.red
                                                  : primaryAccent,
                                              width: 1.0),
                                        ),
                                      ),
                                      style: const TextStyle(color: white),
                                    ),
                                    if (controller.isNameEmpty.value)
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5, left: 1),
                                        child: Text(
                                          'Tolong isi menu terlebih dahulu',
                                          style: TextStyle(color: Colors.red, fontSize: 12),
                                        ),
                                      ),
                                  ],
                                )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Obx(() => Text(
                                  '${controller.currentText.value.length} / ${controller.maxLength}',
                                  style: const TextStyle(color: Colors.grey),
                                )),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Harga Menu",
                                  style: GoogleFonts.nunito(
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Obx(() => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      controller: controller.harga,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      onChanged: controller.setHargaMenu,
                                      decoration: InputDecoration(
                                        hintStyle: const TextStyle(
                                            color: grey, fontSize: 14),
                                        filled: true,
                                        fillColor: textFieldBackground,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              color: controller.isPriceEmpty.value
                                                  ? Colors.red
                                                  : primaryAccent,
                                              width: 1.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              color: controller.isPriceEmpty.value
                                                  ? Colors.red
                                                  : primaryAccent,
                                              width: 1.0),
                                        ),
                                      ),
                                      style: const TextStyle(
                                        color: white,
                                      ),
                                    ),
                                    if (controller.isPriceEmpty.value)
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5, left: 1),
                                        child: Text(
                                          'Tolong isi harga terlebih dahulu',
                                          style: TextStyle(color: Colors.red, fontSize: 12),
                                        ),
                                      ),
                                  ],
                                )),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          );
                        },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20, left: 20, right: 20),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              final isValid = controller.validateTextField();
                              if (isValid) {
                                print("Product ID: $productId");
                                print("Product Name: ${controller.nama.text}");
                                print("Product Price: ${controller.harga.text}");
                                print("Selected Category Name: ${controller.selectedCategory.value.name}");
                                print("Selected Category ID: ${controller.selectedCategory.value.id}");
                                final priceText = controller.harga.text;
                                double? price;
                                price = double.parse(priceText);

                                controller.updateMenu(productId, controller.nama.text, price, controller.selectedCategory.value.id);
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    primaryAccent),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ))),
                            child: Text(
                              "Edit Menu",
                              style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: white),
                              ),
                            ),
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
