import 'package:get/get.dart';
import 'package:shop/View/Screens/category_screen.dart';
import 'package:shop/View/Screens/favorites_screen.dart';
import 'package:shop/View/Screens/home_screen.dart';
import 'package:shop/View/Screens/setting_screen.dart';

class MainController extends GetxController{
  RxInt currentIndex = 0.obs;

  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingScreen(),
  ].obs;

  final title = [
    'Shop',
    'Categories',
    'Favorites',
    'Setting'
  ].obs;

}