import 'dart:convert';

import 'package:get/get.dart';
import 'package:test/model/menu_model.dart';
import 'package:flutter/services.dart'as rootBundel;
import '../../../model/menujson.dart';
class HomeController extends GetxController {
  var menuModelDataCart1 = <Cat1>[].obs;
  var menuModelDataCart2 = <Cat2>[].obs;
  var menuModelDataCart3 = <Cat3>[].obs;
  var menuModelDataCart4 = <Cat4>[].obs;
  var menuModelDataCart5 = <Cat5>[].obs;
  var menuModelDataCart6 = <Cat6>[].obs;
  var isShow1 = false.obs;
  var isShow2 = false.obs;
  var isShow3 = false.obs;
  var isShow4 = false.obs;
  var isShow5 = false.obs;
  var isShow6 = false.obs;



  @override
  void onInit() {
    getMenuCart1();
    getMenuCart2();
    getMenuCart3();
    getMenuCart4();
    getMenuCart5();
    getMenuCart6();
    super.onInit();
  }

// Future<List<MenuModel>> GetMenuData()async{
//   final jsondata = await rootBundel.rootBundle.loadString("assets/menu.json");
// final responselist = json.decode(jsondata) as List<dynamic>;
// return responselist.map((e) => MenuModel.fromJson(e)).toList();
//
// }
  getMenuCart1() {
    menuModelDataCart1.value = MenuData
        .fromJson(menuJson)
        .cat1!;
  }

  getMenuCart2() {
    menuModelDataCart2.value = MenuData
        .fromJson(menuJson)
        .cat2!;
  }

  getMenuCart3() {
    menuModelDataCart3.value = MenuData
        .fromJson(menuJson)
        .cat3!;
  }

  getMenuCart4() {
    menuModelDataCart4.value = MenuData
        .fromJson(menuJson)
        .cat4!;
  }

  getMenuCart5() {
    menuModelDataCart5.value = MenuData
        .fromJson(menuJson)
        .cat5!;
  }

  getMenuCart6() {
    menuModelDataCart6.value = MenuData
        .fromJson(menuJson)
        .cat6!;
  }

  onIncrementItemCart1(index,cartType) {
    cartType[index].itemQuantity! + 1;
    cartType.refresh();
  }

  onDecrementItem(index,cartType) {
    if (cartType[index].itemQuantity! != 1) {
      if (cartType[index].itemQuantity! > 1) {
        cartType[index].itemQuantity! - 1;

        cartType.refresh();
        print(cartType[index].itemQuantity!);

      }
    } else {
      cartType.removeAt(index);
    }
  }
}