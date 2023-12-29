import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/colors/colors.dart';
import 'package:needlinc/needlinc/shared-pages/auth-pages/sign-up.dart';
import 'package:needlinc/needlinc/widgets/snack-bar.dart';
import 'package:needlinc/needlinc/widgets/login-background.dart';
import '../../backend/authentication/login.dart';
import '../../widgets/TextFieldBorder.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isChecked = false;

  void check(bool? newValue) {
    setState(() {
      isChecked = newValue ?? false;
    });
  }



  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passToggle = true;
  bool notLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: notLoading ? Stack(
        children: [
          const backGround(),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(15, 30, 15, 18),
                  decoration: BoxDecoration(
                    color: NeedlincColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
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
                      const Row(
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
                      const SizedBox(height: 15),
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
                                  return null;
                                  // Email Check function
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Email or Username',
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  prefixIcon: Icon(Icons.email),
                                  focusedBorder: Borders.FocusedBorder,
                                  enabledBorder: Borders.EnabledBorder,
                                ),
                              ),
                              const SizedBox(height: 8),
                              // input password
                              TextFormField(
                                controller: passwordController,
                                obscureText: passToggle,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Password";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                  focusedBorder: Borders.FocusedBorder,
                                  enabledBorder: Borders.EnabledBorder,
                                  prefixIcon: const Icon(Icons.lock),
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
                              const SizedBox(height: 3),
                              const SizedBox(height: 3),
                              // Sign in button
                              ElevatedButton(
                                onPressed: () async {
                                  try {
                                    notLoading = false;
                                    setState(() {});
                                    await loginUser(emailController.text.trim(),
                                        passwordController.text, context);
                                    notLoading = true;
                                    setState(() {});
                                    // Add your logic for Client sign-in here
                                    if (_formField.currentState!.validate()) {
                                      emailController.clear();
                                      passwordController.clear();
                                    }
                                  }
                                  catch (error){}
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: NeedlincColors.blue1,
                                  fixedSize: const Size(double.maxFinite, 30),
                                  shape: const BeveledRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                child: const Text('Sign in'),
                              ),
                              const SizedBox(height: 8),
                              // create new account
                              TextButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CreateAccountPage())),
                                style: TextButton.styleFrom(
                                  fixedSize: const Size(double.maxFinite, 30),
                                  shape: const BeveledRectangleBorder(
                                    side: BorderSide(
                                      color: NeedlincColors.blue1,
                                    ),
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                child: const Text(
                                  'Create New Account',
                                  style: TextStyle(
                                    color: NeedlincColors.blue1,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              // forgot password
                              GestureDetector(
                                onTap: (){
                                  //TODO Write your code here
                                },
                                child: const Text(
                                  'forgot password? Click here to reset',
                                  style: TextStyle(
                                    color: NeedlincColors.blue1,
                                    fontSize: 12,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              // or sign up as
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 1,
                                    width: 73,
                                    color: NeedlincColors.black1,
                                  ),
                                  const SizedBox(width: 3),
                                  const Text(
                                    "or sign up as",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  const SizedBox(width: 3),
                                  Container(
                                    height: 1,
                                    width: 73,
                                    color: NeedlincColors.black1,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              // sign up with google
                              TextButton.icon(
                                onPressed: () {
                                  print('Signed up with google');
                                },
                                icon: const Icon(Icons.vpn_lock_rounded),
                                label: const Text(
                                  'Sign up with Google',
                                  style:
                                      TextStyle(color: NeedlincColors.black1),
                                ),
                                style: TextButton.styleFrom(
                                  fixedSize: const Size(double.maxFinite, 30),
                                  shape: const BeveledRectangleBorder(
                                    side: BorderSide(
                                      color: NeedlincColors.black1,
                                    ),
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              // sign up with facebook
                              TextButton.icon(
                                onPressed: () {
                                  print('Signed up with facebook');
                                },
                                icon: const Icon(Icons.facebook),
                                label: const Text(
                                  'Sign up with Facebook',
                                  style:
                                      TextStyle(color: NeedlincColors.black1),
                                ),
                                style: TextButton.styleFrom(
                                  fixedSize: const Size(double.maxFinite, 30),
                                  shape: const BeveledRectangleBorder(
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
              ],
            ),
          ),
        ],
      )
          :
        const Center(
        child: CircularProgressIndicator()
    ),
    );
  }
}
