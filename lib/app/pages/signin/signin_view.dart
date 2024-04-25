import 'package:angkringan_omaci_ta/app/pages/signin/signin_controller.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:angkringan_omaci_ta/app/global_components/background.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

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
                      fontSize: 16, fontWeight: FontWeight.w500, color: white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: primaryAccent,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Align(
                    alignment: Alignment.center,
                    child: Obx(() => DropdownButton<String>(
                          dropdownColor: background,
                          borderRadius: BorderRadius.circular(9.0),
                          value: controller.selectedRole.value.isNotEmpty
                              ? controller.selectedRole.value
                              : null,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              controller.setSelectedRole(newValue);
                            }
                          },
                          underline: const SizedBox(),
                          style: const TextStyle(color: white, fontSize: 16),
                          isExpanded: true,
                          items: <String>['Kasir', 'Owner']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(color: white),
                              ),
                            );
                          }).toList(),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Password",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500, color: white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Obx(
                () => Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: TextField(
                        controller: controller.passwordController,
                        obscureText: controller.isObscure.value,
                        style: const TextStyle(
                          color: white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            color: white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                          filled: true,
                          fillColor: background,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: controller.isPasswordIncorrect.value
                                  ? Colors.red
                                  : primaryAccent,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: controller.isPasswordIncorrect.value
                                  ? Colors.red
                                  : primaryAccent,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          suffixIcon: IconButton(
                            icon: controller.isObscure.value
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                            color: const Color(0xFF6E6E6E),
                            onPressed: () {
                              controller.toggleObscure();
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          print(
                              'Selected Role: ${controller.selectedRole.value}');
                          print(
                              'Password: ${controller.passwordController.text}');

                          controller.checkCredentials();
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(primaryAccent),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ))),
                        child: Text(
                          "Masuk",
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
        ),
      ),
    );
  }
}
