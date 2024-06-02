import 'package:financial_management_program/constants/colors.dart';
import 'package:financial_management_program/controllers/public_controller.dart';
import 'package:financial_management_program/widgets/my_circular.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<publicController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.runSplash();
    return SafeArea(
        top: true,
        child: Scaffold(
          body: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/bg_splash.png',
                ),
                Positioned(
                  bottom: 20,
                  child: MyCircualrProgress(
                    color: cY,
                    size: 40,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
