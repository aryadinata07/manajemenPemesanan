import 'package:angkringan_omaci_ta/app/global_components/appbar.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleOwner/tambahmenu/tambah_menu_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:angkringan_omaci_ta/app/global_components/appbar_back.dart';
import 'package:angkringan_omaci_ta/app/global_components/background.dart';
import 'package:angkringan_omaci_ta/common/routes/app_pages.dart';

class TambahMenuView extends StatelessWidget {
  const TambahMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final TambahMenuController controller = Get.put(TambahMenuController());

    return Scaffold(
      body: BackgroundWidget(
        child: GetBuilder<TambahMenuController>(
          builder: (controller) {
            return SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppbarView(title: "Tambah Menu"),
                        Padding(
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
                                    child: DropdownButton<String>(
                                      dropdownColor: textFieldBackground,
                                      borderRadius: BorderRadius.circular(9.0),
                                      value: controller
                                              .setCategory.value.isNotEmpty
                                          ? controller.setCategory.value
                                          : 'Makanan',
                                      onChanged: (String? newValue) {
                                        if (newValue != null) {
                                          controller
                                              .setSelectedCategory(newValue);
                                          controller.update();
                                        }
                                      },
                                      underline: const SizedBox(),
                                      style: const TextStyle(
                                          color: white, fontSize: 16),
                                      isExpanded: true,
                                      items: <String>[
                                        'Makanan',
                                        'Minuman',
                                        'Jajanan'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: const TextStyle(color: white),
                                          ),
                                        );
                                      }).toList(),
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
                              SizedBox(
                                height: 50,
                                child: TextField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(
                                        controller.maxLength),
                                  ],
                                  decoration: InputDecoration(
                                    hintText: 'Contoh: Nasi Goreng',
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
                                      borderSide: const BorderSide(
                                          color: Color(0xFF8DD5C0), width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF8DD5C0), width: 1.0),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    color: grey,
                                  ),
                                ),
                              ),
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
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: 'Foto Menu ',
                                    style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " Max 2MB",
                                    style: GoogleFonts.nunito(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff7A7A7A),
                                    ),
                                  )
                                ]),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: const Color(0xff2E2E2E),
                                  border: Border.all(
                                    color: const Color(0xFF8DD5C0),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Color(0xff5BA48F),
                                  size: 50,
                                ),
                              ),
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
                              TextField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  hintText: 'Contoh: 10000',
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
                                    borderSide: const BorderSide(
                                        color: primaryAccent, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(
                                        color: primaryAccent, width: 1.0),
                                  ),
                                ),
                                style: const TextStyle(
                                  color: white,
                                ),
                              ),
                            ],
                          ),
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
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        primaryAccent),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ))),
                            child: Text(
                              "Tambah Menu",
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
