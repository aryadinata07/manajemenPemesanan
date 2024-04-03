import 'package:angkringan_omaci_ta/app/pages/splashscreen/splashscreen_controller.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({super.key});
  final SplashScreenController controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Container(
          child: Image.asset("logo_aplikasi.svg"),
        )


      ),

    );
  }
}