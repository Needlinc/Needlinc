import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/colors/colors.dart';
import 'package:needlinc/needlinc/shared-pages/auth-pages/gender.dart';
import 'package:needlinc/needlinc/widgets/login-background.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
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

  bool addPhoto = false;

  void _ShowAddPhoto() {
    setState(() {
      addPhoto = true;
    });
  }

  void _HideAddPhoto() {
    setState(() {
      addPhoto = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backGround(),
          Column(
            children: [
              // Top arrow
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back arrow
                  Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: (){
                          if(addPhoto == false){
                            Navigator.pop(context);
                          }
                          _HideAddPhoto();
                        },
                        icon: Icon(
                          Icons
                              .arrow_back_ios_new, // Specify the icon you want to use
                          size: 30, // Adjust the icon size as needed
                          color:
                              NeedlincColors.white, // Customize the icon color
                        ),
                      )),
                  // Page title
                  Visibility(
                    visible: addPhoto,
                    child: Text(
                      'NEEDLINC',
                      style:
                          TextStyle(color: NeedlincColors.white, fontSize: 12),
                    ),
                  ),
                  // Skip button
                  Visibility(
                    visible: addPhoto,
                    child: Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            color: NeedlincColors.white, fontSize: 21),
                      ),
                    ),
                  )
                ],
              ),
              // main Card
              Center(
                heightFactor: 1.5,
                child: Column(
                  children: [
                    // Card title
                    Text(
                      addPhoto ? 'Add Profile photo' : 'NEEDLINC',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: NeedlincColors.white,
                      ),
                    ),
                    // body
                    SizedBox(height: 20,),
                    Visibility(
                      visible: !addPhoto,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: NeedlincColors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: NeedlincColors.grey,
                              offset: Offset(0, 3),
                              blurRadius: 3.0,
                              spreadRadius: 1.0,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 28, 15, 30),
                          child: Column(
                            children: [
                              // Create New Account
                              Text(
                                'Create New Account',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 15, 30, 0),
                                // Create account fields
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Enter Full Name
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Enter Full Name',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        focusedBorder: FocusedBorder,
                                        enabledBorder: EnabledBorder,
                                        errorBorder: ErrorBorder,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    // Enter User Name
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Enter User Name',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        focusedBorder: FocusedBorder,
                                        enabledBorder: EnabledBorder,
                                        errorBorder: ErrorBorder,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    // Email
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Email',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        focusedBorder: FocusedBorder,
                                        enabledBorder: EnabledBorder,
                                        errorBorder: ErrorBorder,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    // Create Password
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Create Password',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        focusedBorder: FocusedBorder,
                                        enabledBorder: EnabledBorder,
                                        errorBorder: ErrorBorder,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    // Confirm Password
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Confirm Password',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        focusedBorder: FocusedBorder,
                                        enabledBorder: EnabledBorder,
                                        errorBorder: ErrorBorder,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    // Create New Account button
                                    ElevatedButton(
                                      onPressed: _ShowAddPhoto,
                                      child: Text('Create New Account'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: NeedlincColors.blue1,
                                        fixedSize: Size(double.maxFinite, 30),
                                        shape: BeveledRectangleBorder(
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
                    // picture container
                    Visibility(
                      visible: addPhoto,
                      child: Stack(alignment: Alignment.bottomRight, children: [
                        Container(
                          height: 210,
                          width: 210,
                          decoration: BoxDecoration(
                            color: NeedlincColors.white,
                            borderRadius: BorderRadius.circular(150),
                            boxShadow: [
                              BoxShadow(
                                color: NeedlincColors.grey,
                                offset: Offset(0, 3),
                                blurRadius: 3.0,
                                spreadRadius: 1.0,
                              )
                            ],
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/logo.png"),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 30),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: NeedlincColors.blue2,
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(
                              color: NeedlincColors.white,
                              width: 5,
                            ),
                          ),
                          child: Align(
                            child: Icon(Icons.add,
                                size: 35,
                                weight: 50,
                                color: NeedlincColors.white),
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
              // Next button
              Visibility(
                visible: addPhoto,
                child: Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.only(right: 50, bottom: 70),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Gender()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: NeedlincColors.blue1
                      ),
                      child: Text(
                        'Next',
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
