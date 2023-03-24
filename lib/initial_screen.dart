import 'package:animatedgiftbox/signup_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (){
          Navigator.of(context).push(_createRoute());
        },
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                AssetImage("assets/images/animated-gift-box-background.png"),
                fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: Center(
                    child: Stack(
                      children: [
                        // Implement the stroke
                        Text(
                          'TAP',
                          style: TextStyle(
                            fontSize: 30,
                            letterSpacing: 5,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = Colors.black,
                          ),
                        ),
                        // The text inside
                        const Text(
                          'TAP',
                          style: TextStyle(
                            fontSize: 30,
                            letterSpacing: 5,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      )
    );

  }
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const SignupScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
