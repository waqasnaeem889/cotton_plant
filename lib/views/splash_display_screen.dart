import 'package:cotton_plant/utils/contants.dart';
import 'package:cotton_plant/views/intro_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    delay();
  }

  void delay() async {
    await Future.delayed(
     const  Duration(
        milliseconds: 4000,
      ),
      () {
        Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(
            builder: (_) => const IntroScreen() ,
          ),
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: CustomColors.primary,
      body: Center(
        child: Image(
          // color: AppTheme.primaryColor,
          image: AssetImage('assets/images/splash.gif'),
        ),
      ),
    );
  }
}
