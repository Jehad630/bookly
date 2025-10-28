import 'package:booklyapp/features/home/presentation/views/home_view.dart';
import 'package:booklyapp/features/splash/presentation/views/SplashView.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final kHomeView = "/homeView";
  static final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => const Splashview()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
    ],
  );
}
