import 'package:get/get.dart';
import 'package:test/screens/home/controller/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
Get.lazyPut<HomeController>(() => HomeController());
  }

}