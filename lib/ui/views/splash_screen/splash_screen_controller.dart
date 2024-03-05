import 'package:flutter_templete/ui/views/intro_view/intro_view.dart';
import 'package:get/get.dart';

class SplashSceenController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Get.to(IntroView());
    });
    super.onInit();
  }
}
