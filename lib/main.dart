import 'package:clean_architecture/config/routes/application.dart';
import 'package:clean_architecture/config/routes/routes.dart';
import 'package:clean_architecture/config/theme/app_themes.dart';
import 'package:clean_architecture/injection_container.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  initializeDependencies();

  /// Init router
  final router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (_, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: AppTheme.currentTheme.lightTheme,
            darkTheme: AppTheme.currentTheme.darkTheme,
            onGenerateRoute: Application.router?.generator,
            initialRoute: Routes.home,
          );
        });
  }
}
