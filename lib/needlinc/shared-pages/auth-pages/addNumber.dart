import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/backend/user-account/functionality.dart';
import 'package:needlinc/needlinc/colors/colors.dart';
import 'package:needlinc/needlinc/shared-pages/user-type.dart';
import 'package:needlinc/needlinc/widgets/login-background.dart';
import 'package:phone_form_field/phone_form_field.dart';
import '../../widgets/TextFieldBorder.dart';
import 'authSuccess.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {

  late PhoneController phoneNumberController;

  @override
  void initState() {
    super.initState();
    phoneNumberController = PhoneController(null);
    phoneNumberController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }


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
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 30,
                        color: NeedlincColors.white,
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
                            builder: (context) => const UserType(),
                          ),
                        );
                      },
                      child: const Text(
                        '',
                        style: TextStyle(color: NeedlincColors.white, fontSize: 21),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                // main Card
                Column(
                  children: [
                    // Card title
                    const Text(
                      'Add Phone Number',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: NeedlincColors.white,
                      ),
                    ),
                    // body
                    const SizedBox(height: 35),
                    Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Select Country',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: PhoneFormField(
                                    //  initialValue: PhoneNumber(isoCode: 'US'),
                                    controller: phoneNumberController,
                                    defaultCountry: IsoCode.NG,
                                    onChanged: (PhoneNumber){
                                      if (PhoneNumber != null) {
                                        // Access the entered phone number using the phoneNumber parameter
                                        print("Entered Phone Number: +${PhoneNumber.countryCode}${PhoneNumber.nsn}");
                                        // Now you can use phoneNumber.phoneNumber as needed
                                        addPhoneNumber(phoneNumber: "+${PhoneNumber.countryCode}${PhoneNumber.nsn}");
                                      }
                                    },
                                    onSubmitted: (PhoneNumber){
                                      if (PhoneNumber != null) {
                                        // Access the entered phone number using the phoneNumber parameter
                                        print("Entered Phone Number: +${PhoneNumber.characters}");
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const Success(),
                                          ),
                                        );
                                      }
                                    },
                                    onSaved: (PhoneNumber) {
                                      if (PhoneNumber != null) {
                                        addPhoneNumber(phoneNumber: "${PhoneNumber}");
                                      }
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Phone Number',
                                      focusedBorder: Borders.FocusedBorder,
                                      enabledBorder: Borders.EnabledBorder,
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
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.only(right: 15, bottom: 55),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Success(),
                          ),
                        );
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
          ),
        ],
      ),
    );
  }
}