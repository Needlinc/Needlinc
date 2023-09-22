import 'package:flutter/material.dart';
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

  void maleCheck(bool? newValue) {
    setState(() {
      isMale = newValue ?? false;
    });
  }

  void femaleCheck(bool? newValue) {
    setState(() {
      isFemale = newValue ?? false;
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
              // main Card
              Center(
                heightFactor: 1.65,
                child: Column(
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
                      height: 36,
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
                          SizedBox(
                            height: 250,
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
                                padding:
                                    const EdgeInsets.fromLTRB(15.0, 28, 15, 30),
                                child: Placeholder(),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
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
              ),
              // Next button
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.only(right: 50, bottom: 70),
                  child: ElevatedButton(
                    onPressed: () {
                      if (addBirth == true) {
                        Navigator.pop(context);
                      }
                      _ShowAddBirth();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: NeedlincColors.blue1),
                    child: Text(
                      'Next',
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
