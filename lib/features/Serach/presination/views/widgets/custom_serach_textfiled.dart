import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:booklyapp/features/Serach/presination/view_model/cubit/serach_books_cubit.dart';

class CustomSerachTextfiled extends StatefulWidget {
  const CustomSerachTextfiled({super.key});

  @override
  State<CustomSerachTextfiled> createState() => _CustomSerachTextfiledState();
}

class _CustomSerachTextfiledState extends State<CustomSerachTextfiled> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: "Search category (e.g. programming, history...)",
        suffixIcon: IconButton(
          icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 20),
          onPressed: () {
            final query = _controller.text.trim();
            if (query.isNotEmpty) {
              context.read<SerachBooksCubit>().fetchSearchBooks(query);
            }
          },
        ),
        enabledBorder: buildBorder(Colors.white),
        focusedBorder: buildBorder(Colors.blue),
      ),
      onSubmitted: (value) {
        final query = value.trim();
        if (query.isNotEmpty) {
          context.read<SerachBooksCubit>().fetchSearchBooks(query);
        }
      },
    );
  }

  OutlineInputBorder buildBorder(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color, width: 2),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
