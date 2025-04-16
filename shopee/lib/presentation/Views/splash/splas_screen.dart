import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopee/presentation/Views/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed (context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.green, 
      body: Center(
        child: Lottie.asset(
          'assets/ani.json',
          width: screenSize.width * 0.9,  
          height: screenSize.height * 0.75, 
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
