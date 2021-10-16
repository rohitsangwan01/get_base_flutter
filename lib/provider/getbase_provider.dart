// ignore_for_file: avoid_print, non_constant_identifier_names, unused_local_variable
import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:getbase/getbase.dart';

class GetbaseProvider extends GetxService {
  static GetbaseProvider get to => Get.find();
  static late String baseUrldata;
  static late GetConnect httpClient;

  ///Code For Checking Connection
  static Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  ///This Code Called When We Initialise This package First Time
  Future<GetbaseProvider> init() async {
    //Here Initial Code
    return this;
  }

  ///Here Logic For initialisi GetConnect For Further Usage
  GetbaseProvider(String baseurl) {
    baseUrldata = baseurl;
    httpClient = GetConnect();
    httpClient.baseUrl = baseurl;
    httpClient.allowAutoSignedCert;
    httpClient.defaultContentType = "application/json";
    print("🛑 GET_BASE : Connected With GetBase .⚠️");
  }

  ///Function to Check Server Status
  Future CheckServer() async {
    try {
      var response = await httpClient.get('');
      return response;
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  ///Funcion Called When We Use Collection Name
  Future FromCollection(String CollectionName,
      {int limit = 0,
      String action = Action.AllData,
      Map<dynamic, dynamic> sort = const {},
      queryData = const {}}) async {
    try {
      FormData formData = FormData({
        "collection": CollectionName,
        "QueryType": action,
        "limit": limit,
        "Sort": jsonEncode(sort),
        "QueryData": jsonEncode(queryData)
      });
      var response = await httpClient.post('/get', formData);
      if (response.body != null) {
        if (response.body['status'] == 'Error') {
          throw "ResponseError : " + response.body['message'];
        }
      }
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}
