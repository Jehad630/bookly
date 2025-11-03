import 'package:booklyapp/core/widgets/Custom_Button.dart';
import 'package:booklyapp/features/home/data/models/books_model/books_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});
  final BooksModel book;
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

        // for opening the book pdf in google 
        Expanded(
          child: CustomButton(
            onPressed: () async {
              // must do a parse for a link firest 
              Uri url = Uri.parse(book.volumeInfo.previewLink!);
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
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
