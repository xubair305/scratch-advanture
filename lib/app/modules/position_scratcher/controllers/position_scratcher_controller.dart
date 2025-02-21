import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scratch_advanture/app/modules/home/controllers/home_controller.dart';
import 'package:scratcher/scratcher.dart';

class PositionScratcherController extends GetxController {
  late String imagePath;
  final GlobalKey<ScratcherState> scratcherKey = GlobalKey<ScratcherState>();
  final homeController = Get.find<HomeController>();

  @override
  void onInit() {
    imagePath = Get.arguments;
    if (homeController.scratchedImages.contains(imagePath)) {
      Future.delayed(Duration(milliseconds: 1), () {
        scratcherKey.currentState?.reveal();
      });
    }
    super.onInit();
  }
}
