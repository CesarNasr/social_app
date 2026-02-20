import 'package:go_router/go_router.dart';
import 'package:social_app/core/router/route_constants.dart';
import '../../features/posts/domain/entities/posts_entity.dart';
import '../../features/posts/presentation/screens/details_screen.dart';
import '../../features/posts/presentation/screens/home_screen.dart';
import '../../features/splash/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: RouteConstants.splash,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(path: RouteConstants.splash, builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: RouteConstants.home,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: RouteConstants.postDetail,
          builder: (context, state) {
            final post = state.extra as PostEntity;
            return DetailScreen(post: post);
          },
        ),
      ],
    ),
  ],
);
