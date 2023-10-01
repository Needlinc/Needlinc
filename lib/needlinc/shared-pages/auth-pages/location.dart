import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/colors/colors.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              focusNode: _focusNode,
              onTap: () {
                if (_focusNode.hasFocus) {
                  print('Textfield is Active');
                } else
                  print('Textfield not Active');
              },
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
          // Next button
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(right: 50, bottom: 70),
              child: ElevatedButton(
                onPressed: () {
                  // if (addBirth == true) {
                  //   Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => Location()));
                  // }
                  // _ShowAddBirth();
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
    );
  }
}
