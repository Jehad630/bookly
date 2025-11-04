import 'package:booklyapp/core/constants/constants.dart';
import 'package:booklyapp/core/utils/app_routes.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/core/model/books_model/books_model.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/Custom_Book_Image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});

  final BooksModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kbookdetalisView, extra: book);
        },
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              CustomBookImage(
                imageUrl:
                    book.volumeInfo.imageLinks?.thumbnail ??
                    'https://static.vecteezy.com/system/resources/previews/036/437/096/non_2x/illustration-of-book-vector.jpg',
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      book.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow
                          .ellipsis, // llllllllll... if text its long puts 3 points in the end
                      style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      book.volumeInfo.authors?[0] ?? "",
                      maxLines: 1,
                      style: Styles.textStyle14,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          "Free",
                          style: Styles.textStyle20.copyWith(
                            fontFamily: kGTSectraFine,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          FontAwesomeIcons.solidStar,
                          color: Color(0xffFFDD4F),
                        ),
                        const SizedBox(width: 6),
                        const Text("4.8"),
                        const SizedBox(width: 5),
                        const Text(
                          "(2390)",
                          style: TextStyle(color: Color(0xff707070)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
