import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'views/splash_screen/splash_view.dart';
import 'controllers/splash_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FWG Security Services',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(SplashController());
      }),
      home: const SplashView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
