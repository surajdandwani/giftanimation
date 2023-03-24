import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (){
          Navigator.pushNamed(context, '/home');
        },
        child: Container(
          padding:EdgeInsets.all(10),
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
              Positioned(
                  top: 10,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Container(
                        child: Image(image: AssetImage('assets/images/foreground.png'))
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
