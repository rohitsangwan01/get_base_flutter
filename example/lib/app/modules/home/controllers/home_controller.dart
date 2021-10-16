// ignore_for_file: non_constant_identifier_names, avoid_print, unnecessary_overrides

import 'package:get/get.dart';
import 'package:getbase/getbase.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  ChekServer() async {
    try {
      var a = await Getbase.From(
          collection: 'users',
          action: Action.AllData,
          sort: {"_id": SortType.descending},
          filter: {"firstName": "Rohit"});
      print(a.body);
    } catch (e) {
      print(e);
    }
  }
}
