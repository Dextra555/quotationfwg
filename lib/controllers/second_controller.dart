import 'package:get/get.dart';
import '../views/login_screen/login_view.dart';

class SecondController extends GetxController {
  void navigateToLogin() {
    Get.off(() => LoginView());
  }
}




