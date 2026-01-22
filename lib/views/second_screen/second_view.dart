import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/second_controller.dart';

class SecondView extends GetView<SecondController> {
  const SecondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SecondController());
    return Scaffold(
      body: Stack(
        children: [
          


          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/logo.png',
                      width: 110,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),


                const SizedBox(height: 10),
                Expanded(
                  child: Center(
                    child: Image.asset(
                      'assets/loginedit.png',
                      width: 330,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                
                Text(
                  'Professional Security. Trusted',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF8D1E2E), 
                  ),
                ),
                Text(
                  'Protection.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF8D1E2E), // maroon
                  ),
                ),

                const SizedBox(height: 12),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Reliable security guard services for residential, '
                        'commercial, industrial, and event needs—powered by smart technology.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.black54,
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: controller.navigateToLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8D1E2E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
