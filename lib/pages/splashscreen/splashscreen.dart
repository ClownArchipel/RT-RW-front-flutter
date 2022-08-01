import 'dart:async';
import 'package:flutter/material.dart';
import 'package:reterewe/homemain.dart';
import 'package:reterewe/pages/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);
  
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  double opacity = 1.0;
  @override
  void initState() {
    super.initState();
    changeOpacity();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return const CheckAuth();
      }));
    });
  }

  changeOpacity() {
    Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          opacity = opacity == 0.0 ? 1.0 : 0.0;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(seconds: 3),
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/logorete.png"),
            ],
          )
        )),
    );
  }
}

class CheckAuth extends StatefulWidget {
  const CheckAuth({Key? key}) : super(key: key);

  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;

  @override
  void initState() {
    _checkifLoggedIn();
    super.initState();
  }

  void _checkifLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = MyHomePage(indexpage: 0);
    } else {
      child = const LoginPage();
    }

    return Scaffold(
      body: child,
    );
  }
}
