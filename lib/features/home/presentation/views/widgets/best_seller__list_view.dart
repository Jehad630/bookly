import 'package:booklyapp/features/home/presentation/views/widgets/BestSeller_ListView_Item.dart';
import 'package:flutter/material.dart';

class BestSeller_ListView extends StatelessWidget {
  const BestSeller_ListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return BookListViewItem();
      },
    );
  }
}
