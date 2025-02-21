import 'package:get/get.dart';

import '../controllers/choose_level_controller.dart';

class ChooseLevelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseLevelController>(
      () => ChooseLevelController(),
    );
  }
}
