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
    Timer(const Duration(seconds:3), (){
      Navigator.pushReplacement(context,
      MaterialPageRoute(
        builder: (context) => const LoginSignUp(),
        ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/s1.jpg'), // Path to your image
            fit: BoxFit.cover, // To cover the entire screen
          ),
        ),
        //color: const Color.fromARGB(255, 155, 234, 158),
        child: const Center(
          child: Text('Welcome',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        ),
      ),
    );
  }
}