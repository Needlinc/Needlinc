import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/colors/colors.dart';
import 'package:needlinc/needlinc/shared-pages/auth-pages/sign-in.dart';
import 'package:needlinc/needlinc/widgets/EnterApp.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:needlinc/needlinc/widgets/login-background.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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

  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backGround(),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(15, 30, 15, 10),
                decoration: BoxDecoration(
                  color: NeedlincColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 3),
                      blurRadius: 3.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Welcome to NEEDLINC
                    Row(
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
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
                      child: Form(
                        key: _formField,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // input Email
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Email";
                                }
                                // Email Check function
                              },
                              decoration: InputDecoration(
                                labelText: 'Email or Username',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 8.0),
                                prefixIcon: Icon(Icons.email),
                                focusedBorder: FocusedBorder,
                                enabledBorder: EnabledBorder,
                              ),
                            ),
                            SizedBox(height: 8),
                            // input password
                            TextFormField(
                              controller: passwordController,
                              obscureText: passToggle,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Password";
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Password',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 8.0),
                                focusedBorder: FocusedBorder,
                                enabledBorder: EnabledBorder,
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      passToggle = !passToggle;
                                    });
                                  },
                                  child: Icon(
                                    passToggle
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 3),
                            // Remember me
                            Row(
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  onChanged: check,
                                  visualDensity: VisualDensity(
                                      horizontal: -4, vertical: -4),
                                ),
                                Text('Remember me'),
                              ],
                            ),
                            SizedBox(height: 3),
                            // Sign in button
                            ElevatedButton(
                              onPressed: () {
                                // Add your logic for Client sign-in here
                                if (_formField.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignInPage()));
                                  print("success");
                                  emailController.clear();
                                  passwordController.clear();
                                }
                              },
                              child: Text('Sign in'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: NeedlincColors.blue1,
                                fixedSize: Size(double.maxFinite, 30),
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            // create new account
                            TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CreateAccountPage())),
                              child: Text(
                                'Create New Account',
                                style: TextStyle(
                                  color: NeedlincColors.blue1,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                fixedSize: Size(double.maxFinite, 30),
                                shape: BeveledRectangleBorder(
                                  side: BorderSide(
                                    color: NeedlincColors.blue1,
                                  ),
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            // forgot password
                            GestureDetector(
                              onTap: _launchGoogleHomePage,
                              child: Text(
                                'forgot password? Click here to reset',
                                style: TextStyle(
                                  color: NeedlincColors.blue1,
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            // or sign up as
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 1,
                                  width: 73,
                                  color: NeedlincColors.black1,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  "or sign up as",
                                  style: TextStyle(fontSize: 10),
                                ),
                                SizedBox(width: 3),
                                Container(
                                  height: 1,
                                  width: 73,
                                  color: NeedlincColors.black1,
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            // sign up with google
                            TextButton.icon(
                              onPressed: () {
                                print('Signed up with google');
                              },
                              icon: Icon(Icons.vpn_lock_rounded),
                              label: Text(
                                'Sign up with Google',
                                style: TextStyle(color: NeedlincColors.black1),
                              ),
                              style: TextButton.styleFrom(
                                fixedSize: Size(double.maxFinite, 30),
                                shape: BeveledRectangleBorder(
                                  side: BorderSide(
                                    color: NeedlincColors.black1,
                                  ),
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            // sign up with facebook
                            TextButton.icon(
                              onPressed: () {
                                print('Signed up with facebook');
                              },
                              icon: Icon(Icons.facebook),
                              label: Text(
                                'Sign up with Facebook',
                                style: TextStyle(color: NeedlincColors.black1),
                              ),
                              style: TextButton.styleFrom(
                                fixedSize: Size(double.maxFinite, 30),
                                shape: BeveledRectangleBorder(
                                  side: BorderSide(
                                    color: NeedlincColors.black1,
                                  ),
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                            ),
                          ],
                        ),
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
