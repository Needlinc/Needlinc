import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/backend/user-account/functionality.dart';
import 'package:needlinc/needlinc/backend/user-account/user-online-information.dart';
import 'package:needlinc/needlinc/shared-pages/user-type.dart';
import 'package:needlinc/needlinc/widgets/login-background.dart';
import '../../colors/colors.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String categtory = "User";
  double mainWidth = 150, activeWidth = 156;

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
                      onPressed: () => Navigator.pop(context),
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
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        '      ',
                        style: TextStyle(
                            color: NeedlincColors.white, fontSize: 21),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 70),
                Text(
                  'Choose your category',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: NeedlincColors.white,
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // User
                        InkWell(
                          onTap: () {
                            setState(() {
                              categtory = "User";
                            });
                            userCategory(context: context, userType: categtory);
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: (categtory == "User")
                                    ? activeWidth
                                    : mainWidth,
                                height: (categtory == "User")
                                    ? activeWidth
                                    : mainWidth,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: NeedlincColors.white,
                                  border: Border.all(
                                    width: 2,
                                    color: (categtory == "User")
                                        ? NeedlincColors.blue1
                                        : NeedlincColors.blue3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'I want to hire a freelancer',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: NeedlincColors.blue1,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Icon(
                                  Icons.circle,
                                  color: (categtory == "User")
                                      ? NeedlincColors.blue1
                                      : NeedlincColors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        // Freelancer
                        InkWell(
                          onTap: () {
                            setState(() {
                              categtory = "Freelancer";
                            });
                            userCategory(context: context, userType: categtory);
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: (categtory == "Freelancer")
                                    ? activeWidth
                                    : mainWidth,
                                height: (categtory == "Freelancer")
                                    ? activeWidth
                                    : mainWidth,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: NeedlincColors.white,
                                  border: Border.all(
                                    width: 2,
                                    color: (categtory == "Freelancer")
                                        ? NeedlincColors.blue1
                                        : NeedlincColors.blue3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'I am a freelancer',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: NeedlincColors.blue1,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Icon(
                                  Icons.circle,
                                  color: (categtory == "Freelancer")
                                      ? NeedlincColors.blue1
                                      : NeedlincColors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Business
                        InkWell(
                          onTap: () {
                            setState(() {
                              categtory = "Business";
                            });
                            userCategory(context: context, userType: categtory);
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: (categtory == "Business")
                                    ? activeWidth
                                    : mainWidth,
                                height: (categtory == "Business")
                                    ? activeWidth
                                    : mainWidth,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: NeedlincColors.white,
                                  border: Border.all(
                                    width: 2,
                                    color: (categtory == "Business")
                                        ? NeedlincColors.blue1
                                        : NeedlincColors.blue3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'I am a business owner',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: NeedlincColors.blue1,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Icon(
                                  Icons.circle,
                                  color: (categtory == "Business")
                                      ? NeedlincColors.blue1
                                      : NeedlincColors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        // Blogger
                        InkWell(
                          onTap: () {
                            setState(() {
                              categtory = "Blogger";
                            });
                            userCategory(context: context, userType: categtory);
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: (categtory == "Blogger")
                                    ? activeWidth
                                    : mainWidth,
                                height: (categtory == "Blogger")
                                    ? activeWidth
                                    : mainWidth,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: NeedlincColors.white,
                                  border: Border.all(
                                    width: 2,
                                    color: (categtory == "Blogger")
                                        ? NeedlincColors.blue1
                                        : NeedlincColors.blue3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'I am a blogger',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: NeedlincColors.blue1,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Icon(
                                  Icons.circle,
                                  color: (categtory == "Blogger")
                                      ? NeedlincColors.blue1
                                      : NeedlincColors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Next button
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.only(right: 15, bottom: 55),
                    child: ElevatedButton(
                      onPressed: () {
                        UserAccount(FirebaseAuth.instance.currentUser!.uid).updateUserCompleteProfile();
                        switch (categtory) {
                          case 'User':
                            {
                              userCategory(context: context, userType: 'User');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UserType()));
                            }
                            break;
                          case 'Freelancer':
                            {
                              userCategory(context: context, userType: 'Freelancer');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UserType()));
                            }
                            break;
                          case 'Business':
                            {
                              userCategory(context: context, userType: 'Business');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UserType()));
                            }
                            break;
                          case 'Blogger':
                            {
                              userCategory(context: context, userType: 'Blogger');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UserType()));
                            }
                            break;
                          default:;
                        }
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
