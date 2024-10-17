import 'package:elegant_shop_app/core/utils/service_locator.dart';
import 'package:elegant_shop_app/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:elegant_shop_app/features/auth/presentation/login_presentation/views/login_view.dart';
import 'package:elegant_shop_app/features/auth/presentation/manger/cubit/register_cubit.dart';
import 'package:elegant_shop_app/features/auth/presentation/register_presentation/presentation/views/register_view.dart';
import 'package:elegant_shop_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
// GoRouter configuration
  static const String kOnBoarding = "/onBoardingView";
  static const String kLoginView = "/loginView";
  static const String kRegisterView = "/registerView";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => BlocProvider(
      create: (context) => RegisterCubit(authRepo:getIt.get<AuthRepoImplementation>()),
          child: const RegisterView(),
        ),
      ),
    ],
  );
}
