import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:needlinc/needlinc/colors/colors.dart';
import 'package:needlinc/needlinc/shared-pages/auth-pages/intro-page.dart';
import 'package:needlinc/needlinc/widgets/login-background.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Set a delay to navigate to the second screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const WelcomePage2()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Stack(
              children: [
                const backGround(),
                Container(
                  height: MediaQuery.of(context).size.height * 0.34,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'NEEDLINC',
                        speed: const Duration(milliseconds: 220),
                        textStyle: const TextStyle(
                          color: NeedlincColors.white,
                          fontSize: 45,
                       ),
                    ),
                ],
                isRepeatingAnimation: false,
              ),
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.37,
          margin: const EdgeInsets.fromLTRB(0, 25, 0, 0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/1.png"),
            ),
          ),
        ),
      ]),
    );
  }
}
