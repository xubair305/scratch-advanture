import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scratcher/scratcher.dart';

class PositionScratcherController extends GetxController {
  late String imagePath;
  final GlobalKey<ScratcherState> scratcherKey = GlobalKey<ScratcherState>();

  bool isScratched = false; // ✅ Track scratch completion

  @override
  void onInit() {
    imagePath = Get.arguments;
    super.onInit();
  }
}
