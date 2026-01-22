import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/home_screen/home_view.dart';
import '../views/home_screen/homenew.dart';
import '../models/login_response_model.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  var isPasswordVisible = false.obs;
  var isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
      return;
    }

    isLoading.value = true;
    
    try {
      // Simulate loading for better UX
      await Future.delayed(const Duration(seconds: 1));
      
      // Navigate directly to home screen without API call
      Get.snackbar('Success', 'Login successful');
      Get.off(() => SalesDashboardUI());
      
    } catch (e) {
      Get.snackbar('Error', 'Login failed: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  void forgotPassword() {
    Get.snackbar('Info', 'Forgot password functionality');
  }

  void createAccount() {
    Get.snackbar('Info', 'Create account functionality');
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
