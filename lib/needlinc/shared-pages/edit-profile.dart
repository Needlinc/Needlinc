import 'package:flutter/material.dart';

import '../colors/colors.dart';

class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: NeedlincColors.blue1),
        backgroundColor: NeedlincColors.white,
        leading: Icon(Icons.arrow_back_ios_new),
        title: const Text(
          'John Doe',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 15,
          ),
        ),
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10.0),
              child: const Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
    );
  }
}
