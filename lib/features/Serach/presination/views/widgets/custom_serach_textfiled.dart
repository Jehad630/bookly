import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSerachTextfiled extends StatelessWidget {
  const CustomSerachTextfiled({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      decoration: InputDecoration(
        enabledBorder: bulidOutlinedInputBorder(Colors.white),
        disabledBorder: bulidOutlinedInputBorder(Colors.black),
        focusedBorder: bulidOutlinedInputBorder(Colors.white),
        errorBorder: bulidOutlinedInputBorder(Colors.red),
        hintText: "Serach",
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Opacity(
            opacity: .8,
            child: Icon(FontAwesomeIcons.magnifyingGlass, size: 22),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder bulidOutlinedInputBorder(final Color color) {

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: 2.5),
    );
  }
}
