import 'package:flutter/material.dart';
import 'package:smartin_job/component/primaryColorFunction.dart';
import 'package:smartin_job/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: createMaterialColor(const Color(0xff096D65))),
      home: const SplashScreen(),
    );
  }
}
