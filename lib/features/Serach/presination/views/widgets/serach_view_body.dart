import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/core/widgets/Custom_Loading_Indicator.dart';
import 'package:booklyapp/core/widgets/Custom_error_widget.dart';
import 'package:booklyapp/features/Serach/presination/view_model/cubit/serach_books_cubit.dart';
import 'package:booklyapp/features/Serach/presination/views/widgets/custom_serach_textfiled.dart';
import 'package:booklyapp/core/widgets/Book_ListView_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SerachViewBody extends StatelessWidget {
  const SerachViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: CustomSerachTextfiled(),
        ),
        SizedBox(height: 20),
        Text(" Serach Result", style: Styles.textStyle18),
        Expanded(child: SerachResultListView()),
      ],
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
