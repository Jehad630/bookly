import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMesaage});
  final String errMesaage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMesaage,
        style: Styles.textStyle18,
        textAlign: TextAlign.center,
      ),
    );
  }
}
