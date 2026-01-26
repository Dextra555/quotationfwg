import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/home_screen/home_view.dart';
import '../views/home_screen/homenew.dart';
import '../models/login_response_model.dart';
import '../services/api_service.dart';
import '../services/session_service.dart';

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
      final loginResponse = await ApiService.login(
        email: emailController.text,
        password: passwordController.text,
      );
      
      if (loginResponse.success) {
        // Check if user has Sales Executive designation
        final hasSalesExecutiveDesignation = loginResponse.data.user.designations
            .any((designation) => designation.name.toLowerCase() == 'sales executive');
        
        if (hasSalesExecutiveDesignation) {
          // Save login session
          await SessionService.saveLoginSession(loginResponse);
          
          Get.snackbar('Success', 'Login successful');
          Get.off(() => SalesDashboardUI(), arguments: loginResponse.data.user);
        } else {
          Get.snackbar('Access Denied', 'Only Sales Executives are allowed to login');
        }
      } else {
        Get.snackbar('Error', loginResponse.message);
      }
      
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
