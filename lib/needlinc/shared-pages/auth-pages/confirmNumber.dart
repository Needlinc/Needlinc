import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:needlinc/needlinc/shared-pages/auth-pages/location.dart';
import 'package:needlinc/needlinc/widgets/login-background.dart';

import '../../colors/colors.dart';

class confirmNumber extends StatefulWidget {
  const confirmNumber({super.key});

  @override
  State<confirmNumber> createState() => _confirmNumberState();
}

class _confirmNumberState extends State<confirmNumber> {
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

  int lastDigit = 765;

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
                      onPressed: () => Navigator.pop(context),
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
                      '      ',
                      style:
                          TextStyle(color: NeedlincColors.white, fontSize: 21),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 80,
              ),
              // main Card
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Card title
                  Text(
                    'Confirm code',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: NeedlincColors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      'You were sent a 4 digit code to your phone number ~ ********$lastDigit ',
                      style: TextStyle(
                        fontSize: 14,
                        color: NeedlincColors.white,
                      ),
                    ),
                  ),
                  // body
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
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
                      child: Form(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              onSaved: (pin1) {},
                              decoration: InputDecoration(
                                focusedBorder: FocusedBorder,
                                enabledBorder: EnabledBorder,
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: FocusedBorder,
                                enabledBorder: EnabledBorder,
                              ),
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              onSaved: (pin2) {},
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              onSaved: (pin3) {},
                              decoration: InputDecoration(
                                focusedBorder: FocusedBorder,
                                enabledBorder: EnabledBorder,
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              onSaved: (pin4) {},
                              decoration: InputDecoration(
                                focusedBorder: FocusedBorder,
                                enabledBorder: EnabledBorder,
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.only(right: 30, bottom: 70),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Location()));
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
