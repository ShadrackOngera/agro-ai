


import 'package:agro_ai/screens/home/home_screen.dart';
import 'package:agro_ai/screens/splash/splash.dart';
import 'package:agro_ai/utils/routes/route_names.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = RouteNames.splash;
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
      name: RouteNames.splash,
      page: () => const SplashScreen(),
    ),
    //Auth routes
    

    //home
    GetPage(
      name: RouteNames.home_screen,
      page: () => const HomeScreen(),
    ),
  ];
}