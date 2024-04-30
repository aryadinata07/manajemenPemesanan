import 'package:angkringan_omaci_ta/app/global_components/sidebar/sidebar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(SidebarController());
      }),
      title: 'Angkringan Omaci',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      initialRoute: Routes.TESTING,
      getPages: AppPages.routes,
    );
  }
}
