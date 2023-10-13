import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/shared-pages/auth-pages/location.dart';
import 'package:needlinc/needlinc/widgets/calendar.dart';
import '../../colors/colors.dart';
import '../../widgets/login-background.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  bool addBirth = false;
  bool isMale = false, isFemale = false, showOnProfile = false;
  String genderValue = ''; // Initialize genderValue as an empty string

  void maleCheck(bool? newValue) {
    setState(() {
      isMale = newValue ?? false;
      if (isMale) {
        isFemale = false; // Unselect female if male is selected
        genderValue = 'male'; // Set genderValue to 'male'
      } else {
        genderValue = ''; // Reset genderValue if male is unselected
      }
      print(genderValue);
    });
  }

  void femaleCheck(bool? newValue) {
    setState(() {
      isFemale = newValue ?? false;
      if (isFemale) {
        isMale = false; // Unselect male if female is selected
        genderValue = 'female'; // Set genderValue to 'female'
      } else {
        genderValue = ''; // Reset genderValue if female is unselected
      }
      print(genderValue);
    });
  }


  void _ShowAddBirth() {
    setState(() {
      addBirth = true;
    });
  }

  void _HideAddBirth() {
    setState(() {
      addBirth = false;
    });
  }

  void showOnProfileCheck(bool? newValue) {
    setState(() {
      showOnProfile = newValue ?? false;
      print(showOnProfile);
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
                      onPressed: () {
                        if (addBirth == false) {
                          Navigator.pop(context);
                        }
                        _HideAddBirth();
                      },
                      icon: Icon(
                        Icons
                            .arrow_back_ios_new, // Specify the icon you want to use
                        size: 30, // Adjust the icon size as needed
                        color: NeedlincColors.white, // Customize the icon color
                      ),
                    ),
                  ),
                  // Page title
                  Text(
                    'NEEDLINC',
                    style: TextStyle(color: NeedlincColors.white, fontSize: 12),
                  ),
                  // Skip button
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      'Skip',
                      style:
                      TextStyle(color: NeedlincColors.white, fontSize: 21),
                    ),
                  )
                ],
              ),
              SizedBox(height: 80,),
              // main Card
              Column(
                children: [
                  // Card title
                  Text(
                    addBirth ? 'Add Date of Birth' : 'Choose Your Gender',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: NeedlincColors.white,
                    ),
                  ),
                  // body
                  SizedBox(
                    height: 40.0,
                  ),
                  Visibility(
                    visible: !addBirth,
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
                          // choose Gender
                          children: [
                            // Male
                            Row(
                              children: [
                                Checkbox(
                                  value: isMale ? true : false,
                                  onChanged: maleCheck,
                                  visualDensity: VisualDensity(
                                      horizontal: -1, vertical: -1),
                                ),
                                Text(
                                  'Male',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            // Female
                            Row(
                              children: [
                                Checkbox(
                                  value: isFemale ? true : false,
                                  onChanged: femaleCheck,
                                  visualDensity: VisualDensity(
                                      horizontal: -1, vertical: -1),
                                ),
                                Text(
                                  'Female',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Add Date of Birth container
                  Visibility(
                    visible: addBirth,
                    child: Column(
                      children: [
                        Container(
                          height: 360,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Calendar(title: "Date of Birth"),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: showOnProfile ? true : false,
                              onChanged: showOnProfileCheck,
                              visualDensity:
                              VisualDensity(horizontal: -1, vertical: -3),
                            ),
                            Text('Show on profile'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // Next button
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.only(right: 30, bottom: 70),
                  child: ElevatedButton(
                    onPressed: () {
                      if (addBirth == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Location()));
                      }
                      _ShowAddBirth();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: NeedlincColors.blue1,
                      padding: EdgeInsets.all(16),
                    ),
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
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