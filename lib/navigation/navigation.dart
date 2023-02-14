import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test/navigation/routes.dart';
import 'package:test/screens/home/binding/home__binding.dart';
import 'package:test/screens/home/home_view.dart';

class Nav{
  static List<GetPage> routes = [
    GetPage(
        name:Routes.home,
        page: ()=>HomeView(),
        binding: HomeBinding()
    )
  ];
}