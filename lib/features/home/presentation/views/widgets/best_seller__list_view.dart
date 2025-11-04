import 'package:booklyapp/core/widgets/Custom_Loading_Indicator.dart';
import 'package:booklyapp/core/widgets/Custom_error_widget.dart';
import 'package:booklyapp/core/widgets/Book_ListView_Item.dart';
import 'package:booklyapp/features/home/presentation/views_model/newset_books_cubit/newset_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSeller_ListView extends StatelessWidget {
  const BestSeller_ListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 10,
            itemBuilder: (context, index) {
              return BookListViewItem(book: state.books[index],);
            },
          );
        } else if (state is NewsetBooksFaliure) {
          return CustomErrorWidget(errMesaage: state.errmesg);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
