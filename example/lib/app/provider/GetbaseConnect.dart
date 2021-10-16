// ignore_for_file: empty_constructor_bodies, file_names, non_constant_identifier_names, avoid_print

import 'package:get/get.dart';
import 'package:getbase/getbase.dart';

class GetBaseConnect extends GetxService {
  static GetBaseConnect get to => Get.find();

  Future<GetBaseConnect> init() async {
    await ConnectGetBase();
    return this;
  }

  GetBaseConnect() {}

  ConnectGetBase() async {
    try {
      ///Initialise Just Once With BaseUrl
      await Getbase.initialiseBase('http://192.168.43.151:4000/');
      print('Connected With GetBase');
    } catch (e) {
      print(e.toString());
    }
  }

  


}
