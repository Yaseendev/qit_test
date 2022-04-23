import 'dart:io';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'utils/locator.dart';
import 'utils/services/http_override.dart';

void main() {
  locatorsSetup();
  HttpOverrides.global = MyHttpOverrides();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        theme: ThemeData(fontFamily: 'Roboto'),
       onGenerateRoute: locator.get<FluroRouter>().generator,
      );
    });
  }
}
