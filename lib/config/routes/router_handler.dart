import 'package:clean_architecture/core/arguments/product_argument.dart';
import 'package:clean_architecture/core/providers/cubit_provider.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_bloc.dart';
import 'package:clean_architecture/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:clean_architecture/features/favorite_images/presentation/cubit/favorite_image/favorite_image_cubit.dart';
import 'package:clean_architecture/features/favorite_images/presentation/pages/favorite_images_page.dart';
import 'package:clean_architecture/features/food/presentation/cubit/bottom_bar/botton_bar_cubit.dart';
import 'package:clean_architecture/features/food/presentation/pages/category_food_page.dart';
import 'package:clean_architecture/features/food/presentation/pages/detail_food_page.dart';
import 'package:clean_architecture/features/food/presentation/pages/food_main_page.dart';
import 'package:clean_architecture/features/home/presentation/pages/home_page.dart';
import 'package:clean_architecture/features/shopping/presentation/cubit/category/category_cubit.dart';
import 'package:clean_architecture/features/shopping/presentation/cubit/history/history_cubit.dart';
import 'package:clean_architecture/features/shopping/presentation/cubit/product_list/product_list_cubit.dart';
import 'package:clean_architecture/features/shopping/presentation/cubit/slider/slider_cubit.dart';
import 'package:clean_architecture/features/shopping/presentation/cubit/special_product_list/special_product_list_cubit.dart';
import 'package:clean_architecture/features/shopping/presentation/pages/auth_page.dart';
import 'package:clean_architecture/features/shopping/presentation/pages/cart_page.dart';
import 'package:clean_architecture/features/shopping/presentation/pages/history_page.dart';
import 'package:clean_architecture/features/shopping/presentation/pages/product_info_page.dart';
import 'package:clean_architecture/features/shopping/presentation/pages/product_list_page.dart';
import 'package:clean_architecture/features/shopping/presentation/pages/shopping_home_page.dart';
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
      BlocProvider.value(value: foodMainCubit),
    ],
    child: const FoodMainPage(),
  ),
);

Handler categoryFoodHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  final id = params['id']?.first;
  final title = params['title']?.first;
  return BlocProvider.value(
    value: foodMainCubit,
    child: CategoryFoodPage(title ?? "", id ?? ""),
  );
});

Handler detailFoodHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  final id = params['id']?.first;
  final title = params['title']?.first;
  return BlocProvider.value(
    value: foodMainCubit,
    child: DetailFoodPage(id ?? "", title ?? ""),
  );
});

Handler shoppingHomeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => sl<SliderCubit>()),
            BlocProvider(create: (context) => sl<CategoryCubit>()),
            BlocProvider(create: (context) => sl<SpecialProductListCubit>()),
            BlocProvider.value(value: cartCubit),
          ],
          child: const ShoppingHomePage(),
        ));

Handler productListHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  final id = params['id']?.first;
  final title = params['title']?.first;
  return BlocProvider(
    create: (context) => ProductListCubit(sl(), id ?? ""),
    child: ProductListPage(
      categoryId: id ?? "",
      title: title ?? "",
    ),
  );
});

Handler productInfoHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  final ProductArguments args =
      ModalRoute.of(context!)!.settings.arguments as ProductArguments;
  return ProductInfoPage(product: args.product);
});

Handler authHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
        const AuthPage());

Handler cartHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return MultiBlocProvider(providers: [
      BlocProvider.value(value: cartCubit),
    ], child: const CartPage());
  },
);

Handler historyHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
        BlocProvider(
          create: (context) => sl<HistoryCubit>(),
          child: const HistoryPage(),
        ));
