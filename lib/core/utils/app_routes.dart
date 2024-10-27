import 'package:elegant_shop_app/core/utils/service_locator.dart';
import 'package:elegant_shop_app/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:elegant_shop_app/features/auth/presentation/login_presentation/views/login_view.dart';
import 'package:elegant_shop_app/features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:elegant_shop_app/features/auth/presentation/manger/register_cubit/register_cubit.dart';
import 'package:elegant_shop_app/features/auth/presentation/register_presentation/presentation/views/register_view.dart';
import 'package:elegant_shop_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/category_cubit/category_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/category_cubit/category_helper_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/product_cubit/product_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/views/home_view.dart';
import 'package:elegant_shop_app/features/home/presentation/views/product_details_view.dart';
import 'package:elegant_shop_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
// GoRouter configuration
  static const String kOnBoarding = "/onBoardingView";
  static const String kLoginView = "/loginView";
  static const String kRegisterView = "/registerView";
  static const String kHomeView = "/homeView";
  static const String kProductDetailsView = "/productDetailsView";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const ProductDetailsView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  CategoryCubit(homeRepo: getIt.get<HomeRepoImplementation>())
                    ..getAllCategories(),
            ),
            BlocProvider(
              create: (context) => CategoryHelperCubit(true),
            ),
            BlocProvider(
              create: (context) =>
                  ProductCubit(homeRepo: getIt.get<HomeRepoImplementation>())
                    ..getAllProducts(),
            ),
          ],
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              LoginCubit(authRepo: getIt.get<AuthRepoImplementation>()),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              RegisterCubit(authRepo: getIt.get<AuthRepoImplementation>()),
          child: const RegisterView(),
        ),
      ),
    ],
  );
}
