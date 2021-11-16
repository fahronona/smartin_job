import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smartin_job/service/api_service.dart';
import 'package:smartin_job/view/form_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    GetDataApi().getData();
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const FormPage()),
          (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 80,
          child: Image.asset("assets/logo.png"),
        ),
      ),
    );
  }
}
