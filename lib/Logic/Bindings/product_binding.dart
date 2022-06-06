import 'package:get/get.dart';
import 'package:shop/Logic/Controllers/cart_controller.dart';
import 'package:shop/Logic/Controllers/product_controller.dart';

class ProductBinding extends Bindings {


  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
  }

}