import 'package:go_router/go_router.dart';
import '../../features/posts/domain/entities/posts_entity.dart';
import '../../features/posts/presentation/screens/details_screen.dart';
import '../../features/posts/presentation/screens/home_screen.dart';
import '../../features/splash/splash_screen.dart';

const SPLASH_PATH = '/';
const HOME_PATH = '/home';
const POST_DETAILS_PATH = 'post/:id';
const POST_DETAILS_FULL_PATH = '/home/post/:id';

final appRouter = GoRouter(
  initialLocation: SPLASH_PATH,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(path: SPLASH_PATH, builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: HOME_PATH,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: POST_DETAILS_PATH,
          builder: (context, state) {
            final post = state.extra as PostEntity;
            return DetailScreen(post: post);
          },
        ),
      ],
    ),
  ],
);
