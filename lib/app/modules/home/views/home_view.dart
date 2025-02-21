import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scratch_advanture/app/helpers/app_haptic.dart';
import 'package:scratch_advanture/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                            style: TextStyle(color: Colors.white, fontSize: 28),
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              AppHaptics.mediumImpact();
                              controller.imagePaths.shuffle();
                              controller.update();
                            },
                            child: Text('Suffle', style: TextStyle(color: Colors.black, fontSize: 16)),
                          ),
                          IconButton(
                            icon: Icon(Icons.refresh),
                            onPressed: controller.resetScratchedImages,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      /* child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(controller.imagePaths.length, (index) {
                        String imagePath = controller.imagePaths[index];
                        return SizedBox(
                          width: MediaQuery.of(context).size.width / 3 - 12,
                          child: GestureDetector(
                            onTap: () => Get.toNamed(Routes.POSITION_SCRATCHER, arguments: imagePath),
                            child:
                                controller.scratchedImages.contains(imagePath)
                                    ? AnimatedContainer(
                                      duration: 300.milliseconds,
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.deepPurple, width: 2),
                                      ),
                                      child: Hero(
                                        tag: imagePath,
                                        child: CircleAvatar(radius: 60, backgroundImage: AssetImage(imagePath)),
                                      ),
                                    )
                                    : Hero(
                                      tag: imagePath,
                                      child: AnimatedContainer(
                                        duration: 300.milliseconds,
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(image: AssetImage('assets/images/Scratch Field.jpg')),
                                        ),
                                        child: Center(
                                          child: Material(
                                            color: Colors.transparent,
                                            child: Text(
                                              '${index + 1}',
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                          ),
                        );
                      }),
                    ),
                  ),*/
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: controller.imagePaths.length,
                        itemBuilder: (context, index) {
                          String imagePath = controller.imagePaths[index];
                          return SizedBox(
                            width: MediaQuery.of(context).size.width / 3 - 12,
                            child: GestureDetector(
                              onTap: () => Get.toNamed(Routes.POSITION_SCRATCHER, arguments: imagePath),
                              child:
                                  controller.scratchedImages.contains(imagePath)
                                      ? AnimatedContainer(
                                        duration: 300.milliseconds,
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.deepPurple, width: 2),
                                        ),
                                        child: Hero(
                                          tag: imagePath,
                                          child: CircleAvatar(radius: 60, backgroundImage: AssetImage(imagePath)),
                                        ),
                                      )
                                      : Hero(
                                        tag: imagePath,
                                        child: AnimatedContainer(
                                          duration: 300.milliseconds,
                                          width: 120,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage('assets/images/Scratch Field.jpg'),
                                            ),
                                          ),
                                          child: Center(
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
                            ),
                          );
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
