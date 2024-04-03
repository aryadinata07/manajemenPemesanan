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
      title: 'Angkringan Omaci',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}

