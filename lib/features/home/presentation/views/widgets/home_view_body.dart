import 'package:booklyapp/features/home/presentation/views/widgets/CustomAppBar.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/Custom_ListView_Item.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [CustomAppBar(), CustomListViewItem()]);
  }
}
