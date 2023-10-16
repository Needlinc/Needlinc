import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/colors/colors.dart';
import 'package:needlinc/needlinc/shared-pages/auth-pages/addNumber.dart';
import 'package:needlinc/needlinc/widgets/TextFieldBorder.dart';
import '../../backend/user-account/functionality.dart';
import '../../widgets/EnterApp.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
        child: Column(
          children: [
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
                    color: NeedlincColors.blue1, // Customize the icon color
                  ),
                ),
                // Page title
                Text(
                  'NEEDLINC',
                  style: TextStyle(color: NeedlincColors.blue1, fontSize: 12),
                ),
                // Skip button
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryPage()));
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: NeedlincColors.blue1, fontSize: 21),
                  ),
                ),
              ],
            ),
            SizedBox(height: 70),
            // Add location
            Text(
              'Add Location',
              style: TextStyle(
                color: NeedlincColors.blue1,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: locationController,
              decoration: InputDecoration(
                hintText: 'Where do you stay?',
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                focusedBorder: Borders.FocusedBorder,
                enabledBorder: Borders.EnabledBorder,
              ),
            ),
            // Next button
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(right: 15, bottom: 55),
                child: ElevatedButton(
                  onPressed: () {
                    addLocation(location: locationController.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PhoneNumber()));
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
      ),
    );
  }
}
