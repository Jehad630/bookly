import 'package:booklyapp/constants.dart';
import 'package:booklyapp/core/utils/assets.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/BestSeller_ListView_Item.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/CustomAppBar.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/Featured_Books_ListView.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomAppBar(),
          FeaturedBooksListView(),
          SizedBox(height: 50),
          Text("Best Seller", style: Styles.textStyle18),
          BestSellerListViewItem(),
        ],
      ),
    );
  }
}
