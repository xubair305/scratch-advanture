import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scratch_advanture/app/helpers/app_haptic.dart';
import 'package:scratch_advanture/app/modules/home/controllers/home_controller.dart';
import 'package:scratcher/widgets.dart';

import '../controllers/position_scratcher_controller.dart';

class PositionScratcherView extends GetView<PositionScratcherController> {
  PositionScratcherView({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PositionScratcherController>(
      init: PositionScratcherController(),
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  'Scratch the field with your finger 💦',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 44, height: 1.1),
                ),
                Spacer(),
                Hero(
                  tag: controller.imagePath,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(blurRadius: 190, color: Colors.black, spreadRadius: 80)],
                    ),
                    child: ClipOval(
                      child: Scratcher(
                        key: controller.scratcherKey,
                        // color: Color(0xFF7B67ED),
                        image: Image.asset('assets/images/Scratch Field.jpg'),
                        brushSize: 40,
                        threshold: 65,
                        accuracy: ScratchAccuracy.low,
                        onThreshold: () {
                          controller.scratcherKey.currentState?.reveal();
                          homeController.saveScratchedImage(controller.imagePath);
                          homeController.update();
                          controller.update();
                        },
                        child: Image.asset(controller.imagePath),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    AppHaptics.mediumImpact();
                    controller.scratcherKey.currentState?.reset();
                    homeController.removeScratchedImage(controller.imagePath);
                    controller.update();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF7865E3), Color(0xFF5243A8)],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text('Reset', style: TextStyle(color: Colors.white, fontSize: 30)),
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    AppHaptics.mediumImpact();
                    Get.back();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFFcF6FF), Color(0xFFDAD1FE)],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text('Back', style: TextStyle(color: Colors.black, fontSize: 30)),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }
}
