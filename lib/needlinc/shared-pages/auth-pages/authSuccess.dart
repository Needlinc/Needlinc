import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/widgets/EnterApp.dart';
import 'package:needlinc/needlinc/widgets/login-background.dart';
import '../../colors/colors.dart';

class Success extends StatefulWidget {
  const Success({super.key});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Set a delay to navigate to the second screen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => CategoryPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backGround(),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Page title
                Text(
                  'NEEDLINC',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: NeedlincColors.white, fontSize: 12),
                ),
                SizedBox(height: 130),
                // Successful message
                Text(
                  'You have Successfully confirmed your number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
