import 'package:clean_architecture/config/routes/router_handler.dart';
import 'package:fluro/fluro.dart';

class Routes {
  /// Router path
  static String home = "/";
  static String todoList = "/todo-list";
  static String article = "/article";
  static String favoriteImages = "/favorite_images";
  static String foodHome = "/food_home";

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
  }
}
