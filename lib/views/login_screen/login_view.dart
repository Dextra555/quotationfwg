import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Top Red Background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/background.png",
              height: MediaQuery.of(context).size.height * 0.37,
              fit: BoxFit.cover,
            ),
          ),

          // White Rounded Form
          Positioned(
            top: MediaQuery.of(context).size.height * 0.30,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      "Welcome to",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff7A001F),
                      ),
                    ),
                    Text(
                      "FWG Security Services",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Login to manage your security services, bookings, and guard deployments with ease.",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 24),


                    Text(
                      "EMAIL",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 6),

                    TextField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffF3F3F3),
                        hintText: "Ram@gmail.com",
                        hintStyle: GoogleFonts.poppins(color: Colors.black45),
                        suffixIcon: const Icon(Icons.check, color: Color(0xff7A001F)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Password Label
                    Text(
                      "PASSWORD",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 6),

                    TextField(
                      controller: controller.passwordController,
                      obscureText: !controller.isPasswordVisible.value,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffF3F3F3),
                        hintText: "************",
                        hintStyle: GoogleFonts.poppins(color: Colors.black45),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isPasswordVisible.value 
                                ? Icons.visibility 
                                : Icons.visibility_off,
                            color: const Color(0xff7A001F),
                          ),
                          onPressed: () => controller.togglePasswordVisibility(),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.poppins(
                          color: const Color(0xff7A001F),
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Sign In Button
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: Obx(() => ElevatedButton(
                        onPressed: controller.isLoading.value ? null : () => controller.login(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff7A001F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: controller.isLoading.value
                            ? Text(
                                "Loading...",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                "Sign In",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                      )),
                    ),

                    const SizedBox(height: 16),

                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "New here? ",
                          style: GoogleFonts.poppins(color: Colors.black87),
                          children: [
                            TextSpan(
                              text: "Create an Account",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff7A001F),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
