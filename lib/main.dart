import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'screens/login_screen.dart';
import 'utils/locator.dart';

void main() {
  locatorsSetup();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        theme: ThemeData(fontFamily: 'Roboto'),
       // home: const LoginScreen(),
       onGenerateRoute: locator.get<FluroRouter>().generator,
      );
    });
  }
}
