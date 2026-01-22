import 'package:get/get.dart';
import '../views/login_screen/login_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToLoginScreen();
  }

  void navigateToLoginScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => LoginView());
    });
  }
}
