import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/shared-pages/auth-pages/location.dart';
import 'package:needlinc/needlinc/widgets/calendar.dart';
import '../../backend/user-account/functionality.dart';
import '../../colors/colors.dart';
import '../../widgets/login-background.dart';
import '../user-type.dart';

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
      getGender(gender: genderValue);
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
      getGender(gender: genderValue);
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
      displayProfileOption(profileOption: showOnProfile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const backGround(),
          Column(
            children: [
              // Top arrow
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back arrow
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        if (addBirth == false) {
                          Navigator.pop(context);
                        }
                        _HideAddBirth();
                      },
                      icon: const Icon(
                        Icons
                            .arrow_back_ios_new, // Specify the icon you want to use
                        size: 30, // Adjust the icon size as needed
                        color: NeedlincColors.white, // Customize the icon color
                      ),
                    ),
                  ),
                  // Page title
                  const Text(
                    'NEEDLINC',
                    style: TextStyle(color: NeedlincColors.white, fontSize: 12),
                  ),
                  // Skip button
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserType()));
                    },
                    child: const Text(
                      '',
                      style: TextStyle(color: NeedlincColors.blue1, fontSize: 21),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80,),
              // main Card
              Column(
                children: [
                  // Card title
                  Text(
                    addBirth ? 'Add Date of Birth' : 'Choose Your Gender',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: NeedlincColors.white,
                    ),
                  ),
                  // body
                  const SizedBox(
                    height: 40.0,
                  ),
                  Visibility(
                    visible: !addBirth,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: NeedlincColors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
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
                                  visualDensity: const VisualDensity(
                                      horizontal: -1, vertical: -1),
                                ),
                                const Text(
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
                                  visualDensity: const VisualDensity(
                                      horizontal: -1, vertical: -1),
                                ),
                                const Text(
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
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: const Calendar(title: "Date of Birth"),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: showOnProfile ? true : false,
                              onChanged: showOnProfileCheck,
                              visualDensity:
                              const VisualDensity(horizontal: -1, vertical: -3),
                            ),
                            const Text('Show on profile'),
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
                  padding: const EdgeInsets.only(right: 30, bottom: 70),
                  child: ElevatedButton(
                    onPressed: () {
                      if (addBirth == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Location()));
                      }
                      _ShowAddBirth();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: NeedlincColors.blue1,
                      padding: const EdgeInsets.all(16),
                    ),
                    child: const Text(
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