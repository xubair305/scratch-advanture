import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:scratch_advanture/app/helpers/app_haptic.dart';
import 'package:scratch_advanture/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: context.width,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover)),
        child: GetBuilder<HomeController>(
          init: HomeController(),
          builder:
              (_) => Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Column(
                  children: [
                    SafeArea(
                      child: Row(
                        children: [
                          Text(
                            'Scratch Adventure',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 28, height: 1),
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.refresh),
                            onPressed: controller.resetScratchedImages,
                            color: Colors.white,
                          ),
                          GestureDetector(
                            onTap: () {
                              AppHaptics.mediumImpact();
                              controller.imagePaths.shuffle();
                              controller.update();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                              child: Text('Suffle', style: TextStyle(color: Colors.black, fontSize: 16, height: 1)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.only(bottom: 20),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: controller.imagePaths.length,
                        itemBuilder: (context, index) {
                          String imagePath = controller.imagePaths[index];
                          return Hero(
                            tag: imagePath,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 3 - 12,
                              child: GestureDetector(
                                onTap: () {
                                  AppHaptics.lightImpact();
                                  Get.toNamed(Routes.POSITION_SCRATCHER, arguments: imagePath);
                                },
                                child:
                                    controller.scratchedImages.contains(imagePath)
                                        ? AnimatedContainer(
                                          duration: Duration(milliseconds: 300),
                                          width: 120,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Color(0xFF7B67ED), width: 2),
                                          ),
                                          child: CircleAvatar(radius: 60, backgroundImage: AssetImage(imagePath)),
                                        )
                                        : AnimatedContainer(
                                          duration: Duration(milliseconds: 300),
                                          width: 120,
                                          height: 120,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage('assets/images/Scratch Field.jpg'),
                                            ),
                                          ),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: Text(
                                              '${index + 1}',
                                              style: TextStyle(fontSize: 22, color: Colors.white),
                                            ),
                                          ),
                                        ),
                              ),
                            ),
                          ).animate().scaleXY(begin: 0.6, end: 1, duration: Duration(milliseconds: 300));
                        },
                      ),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
