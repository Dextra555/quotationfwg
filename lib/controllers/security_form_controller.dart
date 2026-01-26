import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/security_requirement_model.dart';

class SecurityFormController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final SecurityRequirement requirement = SecurityRequirement();
  
  final List<String> availableSecurityTypes = [
    'Residential Security',
    'Corporate/Office Security',
    'Night Patrol',
    'Industrial Security',
    'Event Security',
  ];
  
  final List<String> shiftTypes = [
    'Day Shift',
    'Night Shift',
    '24/7',
  ];
  
  final List<String> durations = [
    'Hourly',
    'Daily',
    'Weekly',
    'Monthly',
  ];

  void toggleSecurityType(String securityType) {
    if (requirement.securityTypes.contains(securityType)) {
      requirement.securityTypes.remove(securityType);
    } else {
      requirement.securityTypes.add(securityType);
    }
    update();
  }

  void incrementGuards() {
    requirement.numberOfGuards++;
    update();
  }

  void decrementGuards() {
    if (requirement.numberOfGuards > 1) {
      requirement.numberOfGuards--;
      update();
    }
  }

  void setShiftType(String shiftType) {
    requirement.shiftType = shiftType;
    update();
  }

  void setDuration(String duration) {
    requirement.duration = duration;
    update();
  }

  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Please enter a valid 10-digit mobile number';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validateSiteAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter site address';
    }
    return null;
  }

  String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter city';
    }
    return null;
  }

  String? validatePincode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter pincode';
    }
    if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
      return 'Please enter a valid 6-digit pincode';
    }
    return null;
  }

  Future<void> submitForm() async {
    if (!formKey.currentState!.validate()) {
      Get.snackbar(
        'Error',
        'Please fill all required fields correctly',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (requirement.securityTypes.isEmpty) {
      Get.snackbar(
        'Error',
        'Please select at least one security type',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        ),
        barrierDismissible: false,
      );

      await Future.delayed(const Duration(seconds: 2));

      Get.back();

      Get.snackbar(
        'Success',
        'Security requirement submitted successfully!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );

      resetForm();
    } catch (e) {
      Get.back();
      Get.snackbar(
        'Error',
        'Failed to submit form. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void resetForm() {
    formKey.currentState?.reset();
    requirement.reset();
    update();
  }
}
