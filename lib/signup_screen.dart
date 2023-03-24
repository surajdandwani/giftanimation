import 'dart:async';

import 'package:animatedgiftbox/home_screen.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const Homepage(),
          transitionDuration: const Duration(milliseconds: 1500),
          transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (){
        },
        child: Container(
          padding:const EdgeInsets.all(10),
          child:Stack(
            children: <Widget>[
              Positioned(
                child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/animated-gift-box-background.png"),
                        ),
                        color: Colors.white
                    )),
              ),
              const Positioned(
                  top: 10,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Image(image: AssetImage('assets/images/foreground.png')),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

}
