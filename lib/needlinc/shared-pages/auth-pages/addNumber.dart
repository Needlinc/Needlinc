import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:needlinc/needlinc/colors/colors.dart';
import 'package:needlinc/needlinc/shared-pages/auth-pages/confirmNumber.dart';
import 'package:needlinc/needlinc/shared-pages/auth-pages/location.dart';
import 'package:needlinc/needlinc/widgets/login-background.dart';

import '../../widgets/EnterApp.dart';
import '../../widgets/TextFieldBorder.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  final numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backGround(),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
            child: Column(
              children: [
                // Top arrow
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back arrow
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons
                            .arrow_back_ios_new, // Specify the icon you want to use
                        size: 30, // Adjust the icon size as needed
                        color: NeedlincColors.white, // Customize the icon color
                      ),
                    ),
                    // Page title
                    Text(
                      'NEEDLINC',
                      style:
                          TextStyle(color: NeedlincColors.white, fontSize: 12),
                    ),
                    // Skip button
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()));
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            color: NeedlincColors.white, fontSize: 21),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 70),
                // main Card
                Column(
                  children: [
                    // Card title
                    Text(
                      'Add Phone Number',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: NeedlincColors.white,
                      ),
                    ),
                    // body
                    SizedBox(height: 35),
                    Container(
                      width: double.infinity,
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
                      padding: const EdgeInsets.fromLTRB(15, 40, 15, 45),
                      child: TextFormField(
                        controller: numberController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(11),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          labelText: '08010002000',
                          contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                          focusedBorder: Borders.FocusedBorder,
                          enabledBorder: Borders.EnabledBorder,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.only(right: 15, bottom: 55),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => confirmNumber()));
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
          )
        ],
      ),
    );
  }
}
