import 'package:booklyapp/core/utils/service_locater.dart';
import 'package:booklyapp/features/Serach/presination/views/serach_view.dart';
import 'package:booklyapp/core/model/books_model/books_model.dart';
import 'package:booklyapp/core/repo/home_repo_impl.dart';
import 'package:booklyapp/features/home/presentation/views/book_detalis_view.dart';
import 'package:booklyapp/features/home/presentation/views/home_view.dart';
import 'package:booklyapp/features/home/presentation/views_model/similer_books_cubit/similer_books_cubit.dart';
import 'package:booklyapp/features/splash/presentation/views/SplashView.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final kHomeView = "/homeView";
  static final kbookdetalisView = "/BookDetalisView";
  static final kSerachView = "/serachview";
  static final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => const Splashview()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(path: kSerachView, builder: (context, state) => SerachView()),
      GoRoute(
        path: kbookdetalisView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilerBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetalisView(book: state.extra as BooksModel),
        ),
      ),
    ],
  );
}
