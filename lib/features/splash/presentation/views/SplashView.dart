import 'package:booklyapp/features/splash/presentation/views/widgets/SplashViewBody.dart';
import 'package:flutter/material.dart';

class Splashview extends StatelessWidget {
  const Splashview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xff100B20), body: Splashviewbody());
  }
}
