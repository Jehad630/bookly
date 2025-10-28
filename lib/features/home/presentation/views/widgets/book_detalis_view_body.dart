import 'package:booklyapp/features/home/presentation/views/widgets/Custom_Book_Image.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/custom_book_detalis_app_bar.dart';
import 'package:flutter/material.dart';

class BookDetalisViewBody extends StatelessWidget {
  const BookDetalisViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    dynamic WidthSc = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          CustomBookDetalisAppBar(),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: WidthSc * .17),
            child: CustomBookImage(),
          ),
        ],
      ),
    );
  }
}
