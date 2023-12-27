import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/colors/colors.dart';
import 'package:needlinc/needlinc/shared-pages/auth-pages/sign-up.dart';
import 'package:needlinc/needlinc/widgets/login-background.dart';

class WelcomePage2 extends StatefulWidget {
  const WelcomePage2({super.key});

  @override
  State<WelcomePage2> createState() => _WelcomePage2State();
}

class _WelcomePage2State extends State<WelcomePage2> {
  bool showNext = false;
  double small = 15, big = 19;
  final activeColor = NeedlincColors.blue1, inactiveColor = NeedlincColors.grey;

  void _ShowNext() {
    setState(() {
      showNext = true;
    });
  }

  void _HideNext() {
    setState(() {
      showNext = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeedlincColors.white,
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            // Check if the user swiped left or right
            if (details.primaryVelocity! > 0) {
              _HideNext();
            } else {
              _ShowNext();
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                // Tripple Layer
                children: [
                  const backGround(),
                  Container(
                    height: 310,
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    alignment: Alignment.center,
                    child: !showNext
                        ? RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              text: 'NEEDLINC ',
                              style: TextStyle(
                                  fontSize: 23, color: NeedlincColors.white),
                              children: [
                                TextSpan(
                                  text:
                                      'connects all FUTO students to freelancers or workers who are nearby',
                                  style: TextStyle(
                                      fontSize: 23,
                                      color: NeedlincColors.white,
                                      fontFamily: 'Comfortaa-Regular'),
                                )
                              ],
                            ),
                          )
                        : Text(
                            'We provide a secure, safe and fast environment for both artisians and students',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 23,
                              color: NeedlincColors.white,
                              fontFamily: 'Comfortaa-Regular',
                            ),
                          ),
                  ),
                  const SizedBox(height: 135),
                ],
              ),
              // NeedLinc image
              Container(
                width: double.infinity,
                height: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/logo.png"),
                  ),
                ),
              ),
              // Next button
              if (showNext)
                Container(
                  alignment: Alignment.bottomRight,
                  margin: const EdgeInsets.only(right: 20, top: 35),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupPage())),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: NeedlincColors.blue1,
                      padding: const EdgeInsets.all(16),
                    ),
                    child: const Text(
                      "NEXT",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              // Little circles below
              Container(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _HideNext,
                      child: Container(
                        width: showNext ? small : big,
                        height: showNext ? small : big,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              0.5 * (showNext ? small : big)),
                          color: showNext ? inactiveColor : activeColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    GestureDetector(
                      onTap: _ShowNext,
                      child: Container(
                        width: showNext ? big : small,
                        height: showNext ? big : small,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              0.5 * (showNext ? big : small)),
                          color: showNext ? activeColor : inactiveColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
