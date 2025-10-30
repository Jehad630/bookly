import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/Custom_Book_Image.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/books_action.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookDetalisSection extends StatelessWidget {
  const BookDetalisSection({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic WidthSc = MediaQuery.of(context).size.width;
    return Column(
      children: [
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
            const Icon(FontAwesomeIcons.solidStar, color: Color(0xffFFDD4F)),
            const SizedBox(width: 10),
            const Text("4.8"),
            const SizedBox(width: 5),
            const Text("(2390)", style: TextStyle(color: Color(0xff707070))),
          ],
        ),
        const SizedBox(height: 37),
        const BooksAction(),
      ],
    );
  }
}
