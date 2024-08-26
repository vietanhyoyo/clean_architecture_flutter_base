import 'package:clean_architecture/config/routes/router_handler.dart';
import 'package:fluro/fluro.dart';

class Routes {
  /// Router path
  static String home = "/";
  static String todoList = "/todo-list";
  static String article = "/article";
  static String favoriteImages = "/favorite_images";
  static String foodHome = "/food_home";
  static String categoryFood = "/category_food";
  static String detailFood = "/detail_food";
  static String shoppingHome = "/shopping_home";
  static String productList = "/shopping_product_list";
  static String productInfo = "/product_info";
  static String auth = "/auth";
  static String cart = "/cart";
  static String history = "/history";

  /// Setup route for the app
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = notHandler;

    router.define(
      home,
      handler: homeHandler,
      transitionType: TransitionType.inFromLeft,
    );

    router.define(
      todoList,
      handler: todoListHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      article,
      handler: articleHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      favoriteImages,
      handler: favoriteImagesHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      foodHome,
      handler: foodHomeHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      "$categoryFood/:id/:title",
      handler: categoryFoodHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      "$detailFood/:id/:title",
      handler: detailFoodHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      shoppingHome,
      handler: shoppingHomeHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      "$productList/:id/:title",
      handler: productListHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      productInfo,
      handler: productInfoHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      auth,
      handler: authHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      cart,
      handler: cartHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      history,
      handler: historyHandler,
      transitionType: TransitionType.inFromRight,
    );
  }
}
