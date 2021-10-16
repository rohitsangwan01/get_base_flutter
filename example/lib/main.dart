import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getbase/getbase.dart';

import 'app/routes/app_pages.dart';

Future initServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Getbase.initialiseBase('http://192.168.60.236:4000');
}

void main() async {
  await initServices();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
