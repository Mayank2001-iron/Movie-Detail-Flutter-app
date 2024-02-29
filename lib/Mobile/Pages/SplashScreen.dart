


import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'NavBarMobile.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  navigateToScreen() async
  {
    await Future.delayed(const Duration(seconds: 3),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const NavBarMobile()));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Container(
        child:Lottie.asset('assets/images/loading1.json'),
      ),
      ),
    );
  }
}