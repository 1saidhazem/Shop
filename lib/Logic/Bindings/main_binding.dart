import 'package:get/get.dart';
import 'package:shop/Logic/Controllers/main_controller.dart';

class MainBinding extends Bindings {


  @override
  void dependencies() {
    Get.put(MainController());
  }

}