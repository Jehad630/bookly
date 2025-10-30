import 'package:booklyapp/features/Serach/presination/views/serach_view.dart';
import 'package:booklyapp/features/home/presentation/views/book_detalis_view.dart';
import 'package:booklyapp/features/home/presentation/views/home_view.dart';
import 'package:booklyapp/features/splash/presentation/views/SplashView.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final kHomeView = "/homeView";
  static final kbookdetalisView = "/BookDetalisView";
  static final kSerachView = "/serachview";
  static final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => const Splashview()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kbookdetalisView,
        builder: (context, state) => BookDetalisView(),
      ),
      GoRoute(
        path: kSerachView,
        builder: (context, state) => SerachView(),
      ),
    ],
  );
}
