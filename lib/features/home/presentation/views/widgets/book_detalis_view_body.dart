import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/core/widgets/Custom_Button.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/Custom_Book_Image.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/custom_book_detalis_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            padding: EdgeInsets.symmetric(horizontal: WidthSc * .17),
            child: CustomBookImage(),
          ),
          SizedBox(height: 43),
          Text(
            "Book Title",
            maxLines: 2,
            overflow: TextOverflow
                .ellipsis, // llllllllll... if text its long puts 3 points in the end
            style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            "Author Name",
            maxLines: 1,
            style: Styles.textStyle20.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.solidStar, color: Color(0xffFFDD4F)),
              SizedBox(width: 10),
              Text("4.8"),
              SizedBox(width: 5),
              Text("(2390)", style: TextStyle(color: Color(0xff707070))),
            ],
          ),
          SizedBox(height: 37),
          BooksAction(),
        ],
      ),
    );
  }
}

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: "Free",
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            text: "Preview",
            backgroundColor: const Color.fromARGB(255, 216, 132, 132),
            textColor: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}
