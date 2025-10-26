import 'package:booklyapp/constants.dart';
import 'package:booklyapp/core/utils/assets.dart';
import 'package:booklyapp/features/home/presentation/views/home_view.dart';
import 'package:booklyapp/features/splash/presentation/views/widgets/SlidingTextAnimation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Splashviewbody extends StatefulWidget {
  const Splashviewbody({super.key});

  @override
  State<Splashviewbody> createState() => _SplashviewbodyState();
}

class _SplashviewbodyState extends State<Splashviewbody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> sildingAnimtion;

  @override
  void initState() {
    super.initState();
    // animation method
    initSlidingAnimation();
    // transition method
    NavigateToHomeView();
  }

  @override
  void dispose() {
    super.dispose();
    //adding dispose for animationController
    animationController.dispose();
  }

  // widgets
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        SizedBox(height: 4),
        SlidingTextAnimation(sildingAnimtion: sildingAnimtion),
      ],
    );
  }

  // animation method
  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    sildingAnimtion = Tween<Offset>(
      begin: const Offset(0, 16),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  // transition method
  void NavigateToHomeView() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(
        () => const HomeView(),
        transition: Transition.fade,
        duration: kTranstionDuration,
      );
    });
  }
}
