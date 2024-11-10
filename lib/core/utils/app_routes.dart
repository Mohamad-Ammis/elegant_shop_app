import 'package:elegant_shop_app/core/utils/service_locator.dart';
import 'package:elegant_shop_app/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:elegant_shop_app/features/auth/presentation/login_presentation/views/login_view.dart';
import 'package:elegant_shop_app/features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:elegant_shop_app/features/auth/presentation/manger/register_cubit/register_cubit.dart';
import 'package:elegant_shop_app/features/auth/presentation/register_presentation/presentation/views/register_view.dart';
import 'package:elegant_shop_app/features/cart/presentation/cart_view.dart';
import 'package:elegant_shop_app/features/favorite/data/repos/favorite_repo_implementation.dart';
import 'package:elegant_shop_app/features/favorite/presentation/manger/cubit/get_all_favorites_products_cubit.dart';
import 'package:elegant_shop_app/features/favorite/presentation/manger/toggle_favorite_cubit/toggle_favorite_cubit.dart';
import 'package:elegant_shop_app/features/favorite/presentation/views/favorite_view.dart';
import 'package:elegant_shop_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/category_cubit/category_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/category_cubit/category_helper_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/cubit/get_category_products_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/product_cubit/product_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/views/category_products_view.dart';
import 'package:elegant_shop_app/features/home/presentation/views/home_view.dart';
import 'package:elegant_shop_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:elegant_shop_app/features/product_details/data/models/product_details_model/product_details_model.dart';
import 'package:elegant_shop_app/features/product_details/data/repos/product_details_repo_implementation.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/add_product_review_cubit/add_product_review_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/cubit/delete_product_review_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/get_product_details/get_product_details_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/product_important_reviews_cubit/product_important_reviews_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/product_reviews_cubit/product_reviews_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/product_details_view.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/product_reviews_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
// GoRouter configuration
  static const String kOnBoarding = "/onBoardingView";
  static const String kLoginView = "/loginView";
  static const String kRegisterView = "/registerView";
  static const String kHomeView = "/homeView";
  static const String kProductDetailsView = "/productDetailsView";
  static const String kProductDetailsReviewsView = "/productDetailsReviewsView";
  static const String kCategoryProductsView = "/categoryProductsView";
  static const String kAddProductsReviewView = "/addProductReview";
  static const String kFavoriteView = "/favoriteView";
  static const String kCartView = "/cartView";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnBoardingView(),
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
            BlocProvider(
              create: (context) => GetProductDetailsCubit(
                  productDetailsRepo:
                      getIt.get<ProductDetailsRepoImplementation>()),
            ),
            BlocProvider(
              create: (context) => GetCategoryProductsCubit(
                  homeRepo: getIt.get<HomeRepoImplementation>()),
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
      GoRoute(
        path: kProductDetailsView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GetProductDetailsCubit(
                  productDetailsRepo:
                      getIt.get<ProductDetailsRepoImplementation>()),
            ),
            BlocProvider(
              create: (context) => ProductImportantReviewsCubit(
                  productDetailsRepo:
                      getIt.get<ProductDetailsRepoImplementation>()),
            ),
            BlocProvider(
              create: (context) => ProductReviewsCubit(
                  productDetailsRepo:
                      getIt.get<ProductDetailsRepoImplementation>()),
            ),
            BlocProvider(
              create: (context) => ToggleFavoriteCubit(
                  favoriteRepo: getIt.get<FavoriteRepoImplementation>()),
            ),
            BlocProvider(
              create: (context) => DeleteProductReviewCubit(
                  productDetailsRepo:
                      getIt.get<ProductDetailsRepoImplementation>()),
            ),
          ],
          child: ProductDetailsView(
            productInfoUrl: state.extra as String,
          ),
        ),
      ),
      GoRoute(
          path: kProductDetailsReviewsView,
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>;

            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => ProductReviewsCubit(
                      productDetailsRepo:
                          getIt.get<ProductDetailsRepoImplementation>()),
                ),
                BlocProvider(
                  create: (context) => AddProductReviewCubit(
                      productDetailsRepo:
                          getIt.get<ProductDetailsRepoImplementation>()),
                ),
                BlocProvider(
                  create: (context) => DeleteProductReviewCubit(
                      productDetailsRepo:
                          getIt.get<ProductDetailsRepoImplementation>()),
                ),
              ],
              child: ProductReviewsView(
                productDetailsModel:
                    extra['product_details_model'] as ProductDetailsModel,
                productImportantReviewsCubit:
                    extra['product_important_reviews_cubit']
                        as ProductImportantReviewsCubit,
                reviewsCubit: extra['reviews_cubit'] as ProductReviewsCubit,
              ),
            );
          }),
      GoRoute(
        path: kCategoryProductsView,
        builder: (context, state) {
          final extra = state.extra as Map<String, String>;
          return BlocProvider(
            create: (context) => GetCategoryProductsCubit(
                homeRepo: getIt.get<HomeRepoImplementation>()),
            child: CategoryProductsView(
              categoryApiUrl: extra['categoryApiUrl'] ?? '',
              categoryName: extra['categoryName'] ?? '',
            ),
          );
        },
      ),
      GoRoute(
        path: kFavoriteView,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GetAllFavoritesProductsCubit(
                    favoriteRepo: getIt.get<FavoriteRepoImplementation>())
                  ..getAllFavoriteProducts(),
              ),
              BlocProvider(
                  create: (context) => ToggleFavoriteCubit(
                      favoriteRepo: getIt.get<FavoriteRepoImplementation>())),
            ],
            child: const FavoriteView(),
          );
        },
      ),
      GoRoute(
        path: kCartView,
        builder: (context, state) {
          return const CartView();
        },
      )
    ],
  );
}
