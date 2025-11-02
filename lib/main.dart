import 'package:booklyapp/core/constants/constants.dart';
import 'package:booklyapp/core/utils/api_service.dart';
import 'package:booklyapp/core/utils/app_routes.dart';
import 'package:booklyapp/core/utils/service_locater.dart';
import 'package:booklyapp/features/home/data/repo/home_repo_impl.dart';
import 'package:booklyapp/features/home/presentation/views_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/features/home/presentation/views_model/newset_books_cubit/newset_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  SetupServiceLocater();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              NewsetBooksCubit(getIt.get<HomeRepoImpl>()),
        ),
      ],

      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
