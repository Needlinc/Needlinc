import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/colors/colors.dart';
import 'package:needlinc/needlinc/shared-pages/auth-pages/sign-in.dart';
import 'package:needlinc/needlinc/widgets/login-background.dart';

class WelcomePage2 extends StatefulWidget {
  const WelcomePage2({super.key});

  @override
  State<WelcomePage2> createState() => _WelcomePage2State();
}

class _WelcomePage2State extends State<WelcomePage2> {
  final words = [
    'NEEDLINC connects all FUTO students to freelancers or workers who are nearby',
    'We provide a secure, safe and fast environment for both artisians and students'
  ];

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
      body: SingleChildScrollView(
        child: Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onHorizontalDragEnd: (DragEndDetails details) {
                  if (details.primaryVelocity! < 0) {
                    setState(() {
                      showNext = true;
                    });
                    // Swiped to the right
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const SignupPage()),
                    // );
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
                    height: MediaQuery.of(context).size.height * 0.34,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    alignment: Alignment.center,
                    child: Text(
                      showNext ? words.last : words.first,
                      style: const TextStyle(fontSize: 20, color: NeedlincColors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 135),
                ],
              ),
              // NeedLinc image
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
              // Next button
              Visibility(
                visible: showNext,
                child: Container(
                  alignment: Alignment.bottomRight,
                  margin: const EdgeInsets.only(right: 20, top: 60),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const SignupPage())),
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
              ),
              // Little circles below
              Container(
                padding: const EdgeInsets.all(30.0),
                height:
                    showNext ? null : MediaQuery.of(context).size.height * 0.37,
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
        );
       }
      ),
     ),
    );
  }
}
