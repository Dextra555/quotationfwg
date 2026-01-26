import 'package:get/get.dart';
import '../views/login_screen/login_view.dart';
import '../views/home_screen/homenew.dart';
import '../services/session_service.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 2));
    
    final isLoggedIn = await SessionService.isLoggedIn();
    
    if (isLoggedIn) {
      // Get user data and navigate to home
      final userData = await SessionService.getUserData();
      Get.off(() => SalesDashboardUI(), arguments: userData);
    } else {
      // Navigate to login
      Get.off(() => LoginView());
    }
  }
}
