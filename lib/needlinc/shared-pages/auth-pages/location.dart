import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/colors/colors.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeedlincColors.blue3,
      body: Container(
        color: NeedlincColors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back arrow
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons
                          .arrow_back_ios_new, // Specify the icon you want to use
                      size: 30, // Adjust the icon size as needed
                      color: NeedlincColors.blue1, // Customize the icon color
                    ),
                  ),
                ),
                // Page title
                Text(
                  'NEEDLINC',
                  style: TextStyle(color: NeedlincColors.blue1, fontSize: 12),
                ),
                // Skip button
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    'Skip',
                    style: TextStyle(color: NeedlincColors.blue1, fontSize: 21),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Add Location',
              style: TextStyle(
                color: NeedlincColors.blue1,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Where do you stay?',
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: NeedlincColors.blue1,
                    ),
                    borderRadius: BorderRadius.zero,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: NeedlincColors.grey,
                    ),
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
