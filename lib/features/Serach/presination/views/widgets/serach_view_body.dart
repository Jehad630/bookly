import 'package:booklyapp/core/widgets/Book_ListView_Item.dart';
import 'package:booklyapp/core/widgets/Custom_Loading_Indicator.dart';
import 'package:booklyapp/core/widgets/Custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booklyapp/features/Serach/presination/view_model/cubit/serach_books_cubit.dart';
import 'custom_serach_textfiled.dart';

class SerachViewBody extends StatelessWidget {
  const SerachViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const CustomSerachTextfiled(),
          const SizedBox(height: 20),
          const Text(
            "Search Results",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // 🔥 BlocBuilder لعرض الحالات المختلفة
          Expanded(
            child: BlocBuilder<SerachBooksCubit, SerachBooksState>(
              builder: (context, state) {
                if (state is SerachBooksLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SerachBookSuccess) {
                  final books = state.books;
                  if (books.isEmpty) {
                    return const Center(child: Text("No results found 😢"));
                  }
                  return ListView.builder(
                    itemCount: books.length,
                    itemBuilder: (context, index) =>
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: BookListViewItem(book: books[index]),
                        ),
                  );
                } else if (state is SerachBooksFailiure) {
                  return Center(
                    child: Text(
                      "Error: ${state.errmesg}",
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("Type a category and search 🔍"),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}


class SerachResultListView extends StatelessWidget {
  const SerachResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SerachBooksCubit, SerachBooksState>(
      builder: (context, state) {
        if (state is SerachBookSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 10,
            itemBuilder: (context, index) {
              return BookListViewItem(book: state.books[index]);
            },
          );
        } else if (state is SerachBooksFailiure) {
          return CustomErrorWidget(errMesaage: state.errmesg);
        }
        else{
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
