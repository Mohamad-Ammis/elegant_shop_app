import 'package:elegant_shop_app/core/utils/service_locator.dart';
import 'package:elegant_shop_app/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:elegant_shop_app/features/auth/presentation/login_presentation/views/login_view.dart';
import 'package:elegant_shop_app/features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:elegant_shop_app/features/auth/presentation/manger/register_cubit/register_cubit.dart';
import 'package:elegant_shop_app/features/auth/presentation/register_presentation/presentation/views/register_view.dart';
import 'package:elegant_shop_app/features/cart/data/repos/cart_repo_implementation.dart';
import 'package:elegant_shop_app/features/cart/presentation/cart_view.dart';
import 'package:elegant_shop_app/features/cart/presentation/mangers/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:elegant_shop_app/features/cart/presentation/mangers/cart_price_cubit/cart_price_cubit.dart';
import 'package:elegant_shop_app/features/cart/presentation/mangers/cubit/create_order_cubit.dart';
import 'package:elegant_shop_app/features/cart/presentation/mangers/update_cart_products/update_cart_products_cubit.dart';
import 'package:elegant_shop_app/features/cart/presentation/mangers/delete_cart_product_cubit/delete_cart_product_cubit.dart';
import 'package:elegant_shop_app/features/cart/presentation/mangers/get_all_products_cubit/get_all_cart_products_cubit.dart';
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
import 'package:elegant_shop_app/features/orders/data/repo/order_repo_implementation.dart';
import 'package:elegant_shop_app/features/orders/presentation/manger/change_order_model_state.dart/change_order_model_state_cubit.dart';
import 'package:elegant_shop_app/features/orders/presentation/manger/cubit/cancel_exist_order_cubit.dart';
import 'package:elegant_shop_app/features/orders/presentation/manger/get_all_orders_cubit/get_all_orders_cubit.dart';
import 'package:elegant_shop_app/features/orders/presentation/order_view.dart';
import 'package:elegant_shop_app/features/product_details/data/models/product_details_model/product_details_model.dart';
import 'package:elegant_shop_app/features/product_details/data/repos/product_details_repo_implementation.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/add_product_review_cubit/add_product_review_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/cubit/delete_product_review_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/get_product_details/get_product_details_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/product_important_reviews_cubit/product_important_reviews_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/product_reviews_cubit/product_reviews_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/product_details_view.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/product_reviews_view.dart';
import 'package:elegant_shop_app/features/splash/presentation/views/splash_view.dart';
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
  static const String kOrderView = "/orderView";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnBoarding,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  CategoryCubit(homeRepo: getIt.get<HomeRepoImplementation>())
                    ,
            ),
            BlocProvider(
              create: (context) => CategoryHelperCubit(true),
            ),
            BlocProvider(
              create: (context) =>
                  ProductCubit(homeRepo: getIt.get<HomeRepoImplementation>()),
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
            BlocProvider(
              create: (context) =>
                  AddToCartCubit(cartRepo: getIt.get<CartRepoImplementation>()),
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
          return MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) {
                return GetAllCartProductsCubit(
                    cartRepo: getIt.get<CartRepoImplementation>());
              },
            ),
            BlocProvider(
              create: (context) {
                return DeleteCartProductCubit(
                    cartRepo: getIt.get<CartRepoImplementation>());
              },
            ),
            BlocProvider(
              create: (context) {
                return CartPriceCubit();
              },
            ),
            BlocProvider(
              create: (context) {
                return UpdateCartProductsCubit(
                    cartRepo: getIt.get<CartRepoImplementation>());
              },
            ),
            BlocProvider(
              create: (context) {
                return CreateOrderCubit(
                    cartRepo: getIt.get<CartRepoImplementation>());
              },
            ),
          ], child: const CartView());
        },
      ),
      GoRoute(
        path: kOrderView,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GetAllOrdersCubit(
                    orderRepo: getIt.get<OrderRepoImplementation>()),
              ),
              BlocProvider(
                create: (context) => ChangeOrderModelStateCubit(),
              ),
              BlocProvider(
                create: (context) => CancelExistOrderCubit(
                    orderRepo: getIt.get<OrderRepoImplementation>()),
              ),
            ],
            child: const OrderView(),
          );
        },
      )
    ],
  );
}
