import 'package:get/get.dart';

class Functionality extends GetxController {
  RxBool isPasswordHidden = true.obs;
  RxBool remembermee = false.obs;

  void rememberme() {
    remembermee.value = !remembermee.value;
  }
}
