import 'dart:async';

import 'package:flutter/material.dart';

import '../custom/custom_colors.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(
        seconds: 2,
      ),
      vsync: this,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    Timer(
        Duration(seconds: 2, milliseconds: 50),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home())));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: animation,
                child: SizedBox(
                  child: Image.asset('assets/icon/icon.png'),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'hashcode',
                style: TextStyle(
                    letterSpacing: 1,
                    color: customDarkBlack,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
