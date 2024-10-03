import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:get/get.dart';

//import 'login.dart';
import 'login_sign_up.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:2), (){
      Navigator.pushReplacement(context,
      MaterialPageRoute(
        builder: (context) => LoginSignUp(),
        ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 155, 234, 158),
        child: Center(
          child: Text('Welcome',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        ),
      ),
    );
  }
}