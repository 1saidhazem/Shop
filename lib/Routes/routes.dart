import 'package:get/get.dart';
import 'package:shop/Logic/Bindings/auth_binding.dart';
import 'package:shop/Logic/Bindings/main_binding.dart';
import 'package:shop/Logic/Bindings/product_binding.dart';
import 'package:shop/Logic/Controllers/auth_controller.dart';
import 'package:shop/View/Screens/auth/forgot_password_screen.dart';
import 'package:shop/View/Screens/auth/login_screen.dart';
import 'package:shop/View/Screens/auth/signup_screen.dart';
import 'package:shop/View/Screens/cart_screen.dart';
import 'package:shop/View/Screens/main_screen.dart';
import 'package:shop/View/Screens/welcome_screen.dart';

class AppRoutes {
  // initialRoute
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;

  // getPages
  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
      ],
    ),
    // GetPage(
    //   name: Routes.paymentScreen,
    //   page: () => PayMentScreen(),
    //   bindings: [
    //     AuthBinding(),
    //     ProductBinding(),
    //     MainBininding(),
    //   ],
    // ),
  ];
}

class Routes {
  static const welcomeScreen = '/WelcomeScreen';
  static const loginScreen = '/LoginScreen';
  static const signUpScreen = '/SignUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/CartScreen';
  static const paymentScreen = '/paymentScreen';
}
