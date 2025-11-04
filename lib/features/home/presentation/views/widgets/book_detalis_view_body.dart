import 'package:booklyapp/core/model/models/books_model/books_model.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/book_detalis_section.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/custom_book_detalis_app_bar.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetalisViewBody extends StatelessWidget {
  const BookDetalisViewBody({super.key, required this.book});
 final BooksModel book;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                const CustomBookDetalisAppBar(),
                 BookDetalisSection(book: book),
                const Expanded(child: SizedBox(height: 50)),
                const SimilarBooksSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
