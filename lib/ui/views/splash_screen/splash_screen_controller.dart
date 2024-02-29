import 'package:flutter_templete/ui/views/intro_view/intro_view.dart';
import 'package:get/get.dart';

class SplashSceenController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      // if (storage.getFirstLunch())
      Get.to(IntroView());
      //   Get.off(IntroView());
      // //to off back
      // else
      //   Get.off(
      //     storage.isLoggedIn ? MainView() : LandingView(),
      //   );
      // storage.setFirstLunch(false);
      // if (storage.getSubStatus()) {
      //   Get.off(LandingView());
      // } else {
      //   CustomToast.showMessage(
      //       message: "Your Sub expired", messageType: MessageType.WARNING);
      // }
    });
    super.onInit();
  }
}
