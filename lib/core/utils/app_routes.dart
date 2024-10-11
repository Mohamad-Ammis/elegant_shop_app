
import 'package:elegant_shop_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
// GoRouter configuration
  static const String kOnBoarding = "/onBoarding";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnBoardingView(),
      ),
      
    ],
  );
}
