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
      body: Stack(
        children: [
          // Tripple layer
          backGround(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 85, left: 10, right: 10),
                  child: Text(
                    showNext ? words.last : words.first,
                    style: TextStyle(fontSize: 20, color: NeedlincColors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 120),
                // NEEDLINC Image
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.37,
                  margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/logo.png"),
                    ),
                  ),
                ),

                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Next buttons
                      Visibility(
                        visible: showNext,
                        child: Container(
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.only(right: 20, top: 75),
                          child: ElevatedButton(
                            onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage())),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              backgroundColor: NeedlincColors.blue1,
                              padding: EdgeInsets.all(16),
                            ),
                            child: Text(
                              "NEXT",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      // Little buttons
                      Container(
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
                            SizedBox(width: 4.0),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}


//                     // Next button
                     