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
import 'package:clean_architecture/features/food/presentation/cubit/bottom_bar/botton_bar_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ImageService>(ImageService());

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));
  sl.registerSingleton<ImageRepository>(ImageRepositoryImpl(sl()));

  // UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerLazySingleton<GetImageListUseCase>(() => GetImageListUseCase(sl()));

  // Blocs
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));

  // Cubits
  sl.registerFactory<FavoriteImageCubit>(() => FavoriteImageCubit(sl()));
  sl.registerFactory<BottomBarCubit>(() => BottomBarCubit());

}
