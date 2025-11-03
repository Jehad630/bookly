import 'package:booklyapp/features/home/data/models/books_model/books_model.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/book_detalis_view_body.dart';
import 'package:booklyapp/features/home/presentation/views_model/similer_books_cubit/similer_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetalisView extends StatefulWidget {
  const BookDetalisView({super.key, required this.book});
  final BooksModel book;
  @override
  State<BookDetalisView> createState() => _BookDetalisViewState();
}

class _BookDetalisViewState extends State<BookDetalisView> {
  @override
  void initState() {
    BlocProvider.of<SimilerBooksCubit>(
      context,
    ).fetchSimilerBooks(category: widget.book.volumeInfo.categories![0] );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child:  BookDetalisViewBody(book: widget.book,)));
  }
}
