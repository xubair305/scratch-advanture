import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scratch_advanture/app/routes/app_pages.dart';

import '../controllers/choose_level_controller.dart';

class ChooseLevelView extends GetView<ChooseLevelController> {
  const ChooseLevelView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.width,
        height: context.height,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover)),
        child: SafeArea(
          child: Column(
            children: [
              Spacer(flex: 3),
              Image.asset('assets/icons/app-icon.png', scale: 10),
              SizedBox(height: 8),
              Text('Choose a Level', style: TextStyle(color: Colors.white, fontSize: 44, height: 1)),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.HOME, arguments: 1);
                },
                child: Container(
                  height: 80,
                  alignment: Alignment.center,
                  width: context.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(image: AssetImage('assets/icons/btn1.jpg'), fit: BoxFit.cover),
                  ),

                  child: Text('Level 1', style: TextStyle(color: Colors.white, fontSize: 32)),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.HOME, arguments: 2);
                },
                child: Container(
                  height: 80,
                  alignment: Alignment.center,
                  width: context.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(image: AssetImage('assets/icons/btn2.jpg'), fit: BoxFit.cover),
                  ),

                  child: Text('Level 2', style: TextStyle(color: Colors.white, fontSize: 32)),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.HOME, arguments: 3);
                },
                child: Container(
                  height: 80,
                  alignment: Alignment.center,
                  width: context.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),

                    image: DecorationImage(image: AssetImage('assets/icons/btn3.jpg'), fit: BoxFit.cover),
                  ),

                  child: Text('Level 3', style: TextStyle(color: Colors.white, fontSize: 32)),
                ),
              ),
              Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
