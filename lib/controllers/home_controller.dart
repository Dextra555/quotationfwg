import 'package:get/get.dart';
import '../models/login_response_model.dart';

class HomeController extends GetxController {
  // Dashboard data
  final activeServiceCount = 8.obs;
  final pendingRequestsCount = 2.obs;
  final openTicketsCount = 2.obs;
  
  // User data
  final userName = ''.obs;
  final userEmail = ''.obs;
  
  // Bottom navigation
  final selectedIndex = 0.obs;
  
  @override
  void onInit() {
    super.onInit();
    // Get user data from arguments or stored data
    if (Get.arguments != null && Get.arguments is User) {
      final user = Get.arguments as User;
      userName.value = user.name?.toString() ?? 'User';
      userEmail.value = user.email;
    } else {
      userName.value = 'Melvin'; // Default fallback
    }
  }
  
  void onBottomNavTap(int index) {
    selectedIndex.value = index;
  }
  
  // Action button handlers
  void onLeadFormTap() {
    // TODO: Navigate to lead form
    Get.snackbar('Info', 'Lead Form - Coming Soon');
  }
  
  void onQuotationDetailsTap() {
    // TODO: Navigate to quotation details
    Get.snackbar('Info', 'Quotation Details - Coming Soon');
  }
  
  void onViewServicesTap() {
    // TODO: Navigate to view services
    Get.snackbar('Info', 'View Services - Coming Soon');
  }
  
  void onEmergencyCallTap() {
    // TODO: Handle emergency call
    Get.snackbar('Emergency', 'Calling Emergency Services...');
  }
  
  void onRequestServiceTap() {
    // TODO: Navigate to request service
    Get.snackbar('Info', 'Request Service - Coming Soon');
  }
  
  void onContactSupportTap() {
    // TODO: Navigate to contact support
    Get.snackbar('Info', 'Contact Support - Coming Soon');
  }
}
