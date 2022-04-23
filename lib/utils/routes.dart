import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:store_app_test/screens/login_screen.dart';

import '../screens/products_screen.dart';

class Routes {
  static String root = '/';
  static String productsScreen = '/products';
  static var rootHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return LoginScreen();
  });
  static var productsScreenHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return ProductsScreen();
  });

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    router.define(root, handler: rootHandler);
    router.define(productsScreen, handler: productsScreenHandler);
  }
}
