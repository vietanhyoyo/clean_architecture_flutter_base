import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_bloc.dart';
import 'package:clean_architecture/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:clean_architecture/features/favorite_images/presentation/cubit/favorite_image/favorite_image_cubit.dart';
import 'package:clean_architecture/features/favorite_images/presentation/pages/favorite_images_page.dart';
import 'package:clean_architecture/features/food/domain/usecases/get_product.dart';
import 'package:clean_architecture/features/food/domain/usecases/get_products_by_category.dart';
import 'package:clean_architecture/features/food/presentation/cubit/bottom_bar/botton_bar_cubit.dart';
import 'package:clean_architecture/features/food/presentation/cubit/category_food/category_food_cubit.dart';
import 'package:clean_architecture/features/food/presentation/cubit/detail_food/detail_food_cubit.dart';
import 'package:clean_architecture/features/food/presentation/cubit/food_main/food_main_cubit.dart';
import 'package:clean_architecture/features/food/presentation/pages/category_food_page.dart';
import 'package:clean_architecture/features/food/presentation/pages/detail_food_page.dart';
import 'package:clean_architecture/features/food/presentation/pages/food_main_page.dart';
import 'package:clean_architecture/features/home/presentation/pages/home_page.dart';
import 'package:clean_architecture/features/todo_list/presentation/cubit/todo_list/todo_list_cubit.dart';
import 'package:clean_architecture/features/todo_list/presentation/pages/todo_list/todo_list_page.dart';
import 'package:clean_architecture/injection_container.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Handler notHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
      Scaffold(
    body: Center(
      child: Text('$params'),
    ),
  ),
);

Handler homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
        const HomePage());

Handler articleHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
        BlocProvider<RemoteArticleBloc>(
          create: (context) => sl()..add(const GetArticles()),
          child: const DailyNew(),
        ));

Handler todoListHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
        BlocProvider(
            create: (context) => TodoListCubit(), child: const TodoListPage()));

Handler favoriteImagesHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
        BlocProvider<FavoriteImageCubit>(
            create: (context) => sl<FavoriteImageCubit>(),
            child: const FavoriteImagesPage()));

Handler foodHomeHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
      MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => sl<BottomBarCubit>()),
      BlocProvider(create: (context) => sl<FoodMainCubit>()),
    ],
    child: FoodMainPage(),
  ),
);

Handler categoryFoodHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  final id = params['id']?.first;
  final title = params['title']?.first;
  return BlocProvider(
    create: (context) =>
        CategoryFoodCubit(sl<GetProductsByCategoryUseCase>(), id!),
    child: CategoryFoodPage(title ?? ""),
  );
});

Handler detailFoodHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  final id = params['id']?.first;
  return BlocProvider(
    create: (context) => DetailFoodCubit(sl<GetProductUseCase>(), id!),
    child: const DetailFoodPage(),
  );
});
