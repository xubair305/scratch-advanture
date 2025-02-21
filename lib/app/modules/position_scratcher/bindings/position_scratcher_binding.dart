import 'package:get/get.dart';

import '../controllers/position_scratcher_controller.dart';

class PositionScratcherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PositionScratcherController>(
      () => PositionScratcherController(),
    );
  }
}
