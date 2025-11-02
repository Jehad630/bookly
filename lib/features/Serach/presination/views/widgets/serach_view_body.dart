import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/features/Serach/presination/views/widgets/custom_serach_textfiled.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/BestSeller_ListView_Item.dart';
import 'package:flutter/material.dart';

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
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        //return BookListViewItem();
      },
    );
  }
}
