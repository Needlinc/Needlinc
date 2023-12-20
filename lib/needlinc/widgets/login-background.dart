import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/colors/colors.dart';

class backGround extends StatelessWidget {
  const backGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.38,
          decoration: const BoxDecoration(
            color: NeedlincColors.blue3,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(45),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.36,
          decoration: const BoxDecoration(
            color: NeedlincColors.blue2,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(45),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.34,
          width: MediaQuery.of(context).size.width,
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