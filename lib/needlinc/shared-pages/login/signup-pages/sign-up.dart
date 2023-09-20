import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/colors/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:needlinc/needlinc/widgets/login-background.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final ErrorBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: NeedlincColors.red,
    ),
  );
  final EnabledBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: NeedlincColors.black1,
    ),
    borderRadius: BorderRadius.zero,
  );
  final FocusedBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: NeedlincColors.blue1,
    ),
    borderRadius: BorderRadius.zero,
  );

  bool isChecked = false;

  void check(bool? newValue) {
    setState(() {
      isChecked = newValue ?? false;
    });
  }

  Future<void> _launchGoogleHomePage() async {
    final url = Uri(
      scheme: 'https',
      host: 'google.com',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backGround(),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.53,
              width: MediaQuery.of(context).size.width * 0.9,
              margin: EdgeInsets.only(top: 60),
              decoration: BoxDecoration(
                  color: NeedlincColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 3),
                      blurRadius: 3.0,
                      spreadRadius: 1.0,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 28, 15, 0),
                child: Column(
                  children: [
                    // Welcome to NEEDLINC
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WELCOME TO',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 7.0),
                        Text(
                          'NEEDLINC',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: NeedlincColors.blue1),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Email or username
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Email or Username',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8.0),
                              focusedBorder: FocusedBorder,
                              enabledBorder: EnabledBorder,
                              errorBorder: ErrorBorder,
                            ),
                          ),
                          SizedBox(height: 10),
                          // password
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Password',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8.0),
                              focusedBorder: FocusedBorder,
                              enabledBorder: EnabledBorder,
                              errorBorder: ErrorBorder,
                            ),
                          ),
                          SizedBox(height: 5),
                          // Remember me
                          Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: check,
                                visualDensity:
                                    VisualDensity(horizontal: -4, vertical: -4),
                              ),
                              Text('Remember me'),
                            ],
                          ),
                          SizedBox(height: 5),
                          // Sign in
                          ElevatedButton(
                            onPressed: () {
                              print('Signed in');
                            },
                            child: Text('Sign in'),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(230, 30),
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          // create new account
                          TextButton(
                            onPressed: () {
                              print('created new account');
                            },
                            child: Text('Create New Account'),
                            style: TextButton.styleFrom(
                              fixedSize: Size(230, 30),
                              shape: BeveledRectangleBorder(
                                side: BorderSide(
                                  color: Colors.blue,
                                ),
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          // forgot password?
                          GestureDetector(
                            onTap: _launchGoogleHomePage,
                            child: Text(
                              'forgot password? Click here to reset',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          SizedBox(height: 17),
                          // or sign up as
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(height: 1, width: 78, color: Colors.black,),
                              SizedBox(width: 3),
                              Text("or sign up as", style: TextStyle(fontSize: 10),),
                              SizedBox(width: 3),
                              Container(height: 1, width: 78, color: Colors.black,),
                            ],
                          ),
                          SizedBox(height: 17),
                          // Sign up with Google
                          TextButton.icon(
                            onPressed: () {
                              print('Signed up with google');
                            },
                            icon: Icon(Icons.vpn_lock_rounded),
                            label: Text(
                              'Sign up with Google',
                              style: TextStyle(color: Colors.black),
                            ),
                            style: TextButton.styleFrom(
                              fixedSize: Size(230, 30),
                              shape: BeveledRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          // Sign up with Facebook
                          TextButton.icon(
                            onPressed: () {
                              print('Signed up with facebook');
                            },
                            icon: Icon(Icons.facebook),
                            label: Text(
                              'Sign up with Facebook',
                              style: TextStyle(color: Colors.black),
                            ),
                            style: TextButton.styleFrom(
                              fixedSize: Size(230, 30),
                              shape: BeveledRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.zero,
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
          ),
        ],
      ),
    );
  }
}