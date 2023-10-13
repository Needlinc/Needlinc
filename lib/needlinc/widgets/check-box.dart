import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needlinc/needlinc/colors/colors.dart';

class CheckboxWidget extends StatefulWidget {
  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? newValue) {
            setState(() {
              isChecked = newValue!;
            });
          },
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Notify a freelancer',
              style: GoogleFonts.oxygen(fontWeight: FontWeight.w500),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                  'This allows your post to directly notify a freelancer who you might need to come work for you.',
                style: TextStyle(
                  fontSize: 12,
                  color: NeedlincColors.black2
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}