import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         
          Positioned.fill(
            child: Image.asset(
              'assets/loginbackground.png',
              fit: BoxFit.cover,   
            ),
          ),

         
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.55),
            ),
          ),

         
          Center(
            child: Image.asset(
              'assets/logo.png',
              width: 230,
              height: 230,
            ),
          ),
        ],
      ),
    );
  }
}
