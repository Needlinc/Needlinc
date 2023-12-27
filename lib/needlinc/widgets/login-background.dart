import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/colors/colors.dart';

class backGround extends StatelessWidget {
  const backGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 290,
          decoration: const BoxDecoration(
            color: NeedlincColors.blue3,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(45),
            ),
          ),
        ),
        Container(
          height: 270,
          decoration: const BoxDecoration(
            color: NeedlincColors.blue2,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(45),
            ),
          ),
        ),
        Container(
          height: 250,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: NeedlincColors.blue1,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(45),
            ),
          ),
        )
      ],
    );
  }
}
