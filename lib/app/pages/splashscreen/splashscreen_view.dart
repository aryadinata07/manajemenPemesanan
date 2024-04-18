import 'package:angkringan_omaci_ta/app/pages/splashscreen/splashscreen_controller.dart';
import 'package:angkringan_omaci_ta/app/global_components/background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenView extends StatelessWidget {
  SplashScreenView({super.key});
  final SplashScreenController controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    //DONE
    return Scaffold(
      body: BackgroundWidget(
        child: Center(
          child: Image.asset("assets/images/omaci_logo.png"),
        ),
      ),
    );
  }
}
