import 'package:clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_architecture/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:clean_architecture/features/daily_news/domain/repository/article_repository.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_bloc.dart';
import 'package:clean_architecture/features/favorite_images/data/data_sources/local/image_service.dart';
import 'package:clean_architecture/features/favorite_images/data/repository/image_repository_impl.dart';
import 'package:clean_architecture/features/favorite_images/domain/repository/image_repository.dart';
import 'package:clean_architecture/features/favorite_images/domain/usecases/get_image_list.dart';
import 'package:clean_architecture/features/favorite_images/presentation/cubit/favorite_image/favorite_image_cubit.dart';
import 'package:clean_architecture/features/food/data/data_sources/category_service.dart';
import 'package:clean_architecture/features/food/data/data_sources/product_service.dart';
import 'package:clean_architecture/features/food/data/repository/category_repository_impl.dart';
import 'package:clean_architecture/features/food/data/repository/product_repository_impl.dart';
import 'package:clean_architecture/features/food/domain/repository/category_repository.dart';
import 'package:clean_architecture/features/food/domain/repository/product_repository.dart';
import 'package:clean_architecture/features/food/domain/usecases/get_category_list.dart';
import 'package:clean_architecture/features/food/domain/usecases/get_product.dart';
import 'package:clean_architecture/features/food/domain/usecases/get_product_list.dart';
import 'package:clean_architecture/features/food/domain/usecases/get_products_by_category.dart';
import 'package:clean_architecture/features/food/presentation/cubit/bottom_bar/botton_bar_cubit.dart';
import 'package:clean_architecture/features/food/presentation/cubit/food_main/food_main_cubit.dart';
import 'package:clean_architecture/features/shopping/data/data_sources/remote/dio.dart';
import 'package:clean_architecture/features/shopping/data/data_sources/remote/shopping_api_service.dart';
import 'package:clean_architecture/features/shopping/data/repository/auth_repository_impl.dart';
import 'package:clean_architecture/features/shopping/data/repository/cart_repository_impl.dart';
import 'package:clean_architecture/features/shopping/data/repository/category_repository_impl.dart'
    as shopping;
import 'package:clean_architecture/features/shopping/data/repository/product_repository_impl.dart'
    as shopping;
import 'package:clean_architecture/features/shopping/data/repository/slider_repository_impl.dart';
import 'package:clean_architecture/features/shopping/domain/repository/auth_repository.dart';
import 'package:clean_architecture/features/shopping/domain/repository/cart_repository.dart';
import 'package:clean_architecture/features/shopping/domain/repository/category_repository.dart'
    as shopping;
import 'package:clean_architecture/features/shopping/domain/repository/product_repository.dart'
    as shopping;
import 'package:clean_architecture/features/shopping/domain/repository/slider_repository.dart';
import 'package:clean_architecture/features/shopping/domain/usecases/get_category_list_usecase.dart'
    as shopping;
import 'package:clean_architecture/features/shopping/domain/usecases/get_product_list_usecase.dart'
    as shopping;
import 'package:clean_architecture/features/shopping/domain/usecases/get_product_list_of_category_usecase.dart';
import 'package:clean_architecture/features/shopping/domain/usecases/get_sliders_usecase.dart';
import 'package:clean_architecture/features/shopping/domain/usecases/post_make_order_usecase.dart';
import 'package:clean_architecture/features/shopping/presentation/cubit/cart/cart_cubit.dart';
import 'package:clean_architecture/features/shopping/presentation/cubit/category/category_cubit.dart';
import 'package:clean_architecture/features/shopping/presentation/cubit/slider/slider_cubit.dart';
import 'package:clean_architecture/features/shopping/presentation/cubit/special_product_list/special_product_list_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(createDio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ImageService>(ImageService());
  sl.registerSingleton<CategoryService>(CategoryService());
  sl.registerSingleton<ProductService>(ProductService());
  sl.registerSingleton<ShoppingApiService>(ShoppingApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));
  sl.registerSingleton<ImageRepository>(ImageRepositoryImpl(sl()));
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl(sl()));
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl(sl()));
  sl.registerSingleton<SliderRepository>(SliderRepositoryImpl(sl()));
  sl.registerSingleton<shopping.CategoryRepository>(
      shopping.CategoryRepositoryImpl(sl()));
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<shopping.ProductRepository>(
      shopping.ProductRepositoryImpl(sl()));
  sl.registerSingleton<CartRepository>(CartRepositoryImpl(sl()));

  // UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerLazySingleton<GetImageListUseCase>(
      () => GetImageListUseCase(sl()));
  sl.registerLazySingleton<GetCategoryListUseCase>(
      () => GetCategoryListUseCase(sl()));
  sl.registerLazySingleton<GetProductsByCategoryUseCase>(
      () => GetProductsByCategoryUseCase(sl()));
  sl.registerSingleton<GetProductUseCase>(GetProductUseCase(sl()));
  sl.registerSingleton<GetProductListUseCase>(GetProductListUseCase(sl()));
  sl.registerSingleton<GetSlidersUseCase>(GetSlidersUseCase(sl()));
  sl.registerLazySingleton<shopping.GetCategoryListUseCase>(
      () => shopping.GetCategoryListUseCase(sl()));
  sl.registerLazySingleton<GetProductListOfCategoryUseCase>(
      () => GetProductListOfCategoryUseCase(sl()));
  sl.registerSingleton<shopping.GetProductListUseCase>(
      shopping.GetProductListUseCase(sl()));
  sl.registerSingleton<PostMakeOrderUseCase>(PostMakeOrderUseCase(sl()));

  // Blocs
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));

  // Cubits
  sl.registerFactory<FavoriteImageCubit>(() => FavoriteImageCubit(sl()));
  sl.registerFactory<BottomBarCubit>(() => BottomBarCubit());
  sl.registerFactory<FoodMainCubit>(() => FoodMainCubit(sl(), sl()));
  sl.registerFactory<SliderCubit>(() => SliderCubit(sl()));
  sl.registerFactory<CategoryCubit>(
      () => CategoryCubit(sl<shopping.GetCategoryListUseCase>()));
  sl.registerFactory<SpecialProductListCubit>(
      () => SpecialProductListCubit(sl()));
  sl.registerFactory<CartCubit>(() => CartCubit(sl()));
}
