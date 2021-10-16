// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getbase/provider/getbase_provider.dart';

class Getbase {
  static const MethodChannel _channel = MethodChannel('getbase');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  ///User Have to Pass a Connection Url
  static Future initialiseBase(String url) async {
    if (Get.isRegistered<GetbaseProvider>()) {
      throw Exception('GetBase is Already Initialised With Url : ' +
          GetbaseProvider.baseUrldata);
    }
    await Get.putAsync(() => GetbaseProvider(url).init());
  }

  ///Call this to Get a Response , To Check if Server is Working
  static Future CheckServer() async {
    try {
      var Data = await GetbaseProvider.to.CheckServer();
      return Data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  ///To Get Data From a Collection
  static Future From(
      {required String collection,
      int limit = 0,
      Map<dynamic, dynamic> sort = const {},
      String action = Action.AllData,
      Map<dynamic, dynamic> filter = const {}}) async {
    try {
      var Data = await GetbaseProvider.to.FromCollection(collection,
          limit: limit, action: action, queryData: filter, sort: sort);
      return Data;
    } catch (e) {
      throw e.toString();
    }
  }
}

class Action {
  static const String AllData = "ALL";
  static const String OnlyOne = "ONE";
  static const String DeleteOne = "DELETE_ONE";
  static const String DROP_COLL = "DROP_COLL";
  static const String ADD = "ADD";
  static const String UPDATE = "UPDATE";
}

class SortType {
  static const ascending = 1;
  static const descending = -1;
}
