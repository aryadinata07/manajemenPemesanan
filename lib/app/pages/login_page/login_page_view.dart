// login_page_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:angkringan_omaci_ta/app/global_components/background.dart';
import 'package:angkringan_omaci_ta/app/pages/login_page/login_page_controller.dart';

class LoginPageView extends StatelessWidget {
  final LoginPageController controller = Get.put(LoginPageController());

  LoginPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Padding(
          padding: EdgeInsets.only(
            left: 33,
            right: 33,
            top: MediaQuery.of(context).size.height * 0.1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset("assets/images/omaci_logo.png"),
              ),
              const SizedBox(
                height: 80,
              ),
              Text(
                "Role",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xff2E2E2E),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Color(0xff8DD5C0),
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Align(
                    alignment: Alignment.center,
                    child: Obx(() => DropdownButton<String>(
                          dropdownColor: Color(
                              0xff2E2E2E), // Mengatur warna latar belakang dropdown popup menjadi hitam
                          hint: const Text(
                            'Pilih role anda',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          value: controller.selectedRole.value.isNotEmpty
                              ? controller.selectedRole.value
                              : null,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              controller.setSelectedRole(newValue);
                            }
                          },
                          underline: SizedBox(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                          isExpanded: true,
                          items: <String>['Kasir', 'Owner']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          }).toList(),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 27,
              ),
              Text(
                "Password",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Obx(
                () => SizedBox(
                  height: 60,
                  child: TextField(
                    obscureText: controller.isObscure.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      filled: true,
                      fillColor: const Color(0xff2E2E2E),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xff8DD5C0),
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xff8DD5C0),
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      suffixIcon: IconButton(
                        icon: controller.isObscure.value
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        color: Colors.white,
                        onPressed: () {
                          controller.toggleObscure();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
