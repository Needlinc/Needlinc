import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/business-pages/business-main.dart';
import 'package:needlinc/needlinc/widgets/login-background.dart';
import '../client-pages/client-main.dart';
import '../colors/colors.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String categtory = "notFreeLancers";
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
                        // notFreeLancers
                        InkWell(
                          onTap: () {
                            setState(() {
                              categtory = "notFreeLancers";
                            });
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: (categtory == "notFreeLancers")
                                    ? activeWidth
                                    : mainWidth,
                                height: (categtory == "notFreeLancers")
                                    ? activeWidth
                                    : mainWidth,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: NeedlincColors.white,
                                  border: Border.all(
                                    width: 2,
                                    color: (categtory == "notFreeLancers")
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
                                  color: (categtory == "notFreeLancers")
                                      ? NeedlincColors.blue1
                                      : NeedlincColors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        // FreeLancers
                        InkWell(
                          onTap: () {
                            setState(() {
                              categtory = "FreeLancers";
                            });
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: (categtory == "FreeLancers")
                                    ? activeWidth
                                    : mainWidth,
                                height: (categtory == "FreeLancers")
                                    ? activeWidth
                                    : mainWidth,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: NeedlincColors.white,
                                  border: Border.all(
                                    width: 2,
                                    color: (categtory == "FreeLancers")
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
                                  color: (categtory == "FreeLancers")
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
                        // businessOwner
                        InkWell(
                          onTap: () {
                            setState(() {
                              categtory = "businessOwner";
                            });
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: (categtory == "businessOwner")
                                    ? activeWidth
                                    : mainWidth,
                                height: (categtory == "businessOwner")
                                    ? activeWidth
                                    : mainWidth,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: NeedlincColors.white,
                                  border: Border.all(
                                    width: 2,
                                    color: (categtory == "businessOwner")
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
                                  color: (categtory == "businessOwner")
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
                        switch (categtory) {
                          case 'notFreeLancers':
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ClientMainPages(currentPage: 0)));
                            }
                            break;
                          case 'FreeLancers':
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ClientMainPages(currentPage: 0)));
                            }
                            break;
                          case 'businessOwner':
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BusinessMainPages(currentPage: 0)));
                            }
                            break;
                          case 'Blogger':
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BusinessMainPages(currentPage: 0)));
                            }
                            break;
                          default:
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
