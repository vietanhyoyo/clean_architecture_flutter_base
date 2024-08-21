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
import 'package:clean_architecture/features/food/domain/usecases/get_products_by_category.dart';
import 'package:clean_architecture/features/food/presentation/cubit/bottom_bar/botton_bar_cubit.dart';
import 'package:clean_architecture/features/food/presentation/cubit/food_home/food_home_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ImageService>(ImageService());
  sl.registerSingleton<CategoryService>(CategoryService());
  sl.registerSingleton<ProductService>(ProductService());

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));
  sl.registerSingleton<ImageRepository>(ImageRepositoryImpl(sl()));
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl(sl()));
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl(sl()));

  // UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerLazySingleton<GetImageListUseCase>(
      () => GetImageListUseCase(sl()));
  sl.registerLazySingleton<GetCategoryListUseCase>(
      () => GetCategoryListUseCase(sl()));
  sl.registerLazySingleton<GetProductsByCategoryUseCase>(
      () => GetProductsByCategoryUseCase(sl()));
  sl.registerSingleton<GetProductUseCase>(GetProductUseCase(sl()));

  // Blocs
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));

  // Cubits
  sl.registerFactory<FavoriteImageCubit>(() => FavoriteImageCubit(sl()));
  sl.registerFactory<BottomBarCubit>(() => BottomBarCubit());
  sl.registerFactory<FoodHomeCubit>(() => FoodHomeCubit(sl()));
}
