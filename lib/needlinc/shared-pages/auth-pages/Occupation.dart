import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/widgets/login-background.dart';
import '../../colors/colors.dart';

class Occupation extends StatefulWidget {
  const Occupation({super.key});

  @override
  State<Occupation> createState() => _OccupationState();
}

class _OccupationState extends State<Occupation> {
  final occupations = [
    'Barber',
    'Carpenter',
    'Electrician',
    'Hairdresser',
    'Generator Repairer',
    'Laptop Repairer',
    'Phone Repairer',
    'Makeup artist',
    'Mechanic',
    'Plumber',
    'Refrigerator Repairer',
    'Shoe Maker',
    'Tailor',
    'Other',
  ];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeedlincColors.white,
      appBar: AppBar(
        backgroundColor: NeedlincColors.blue1,
        foregroundColor: NeedlincColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new, // Specify the icon you want to use
            size: 30, // Adjust the icon size as needed
          ),
        ),
        centerTitle: true,
        title: const Text(
          'NEEDLINC',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const backGround(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    height: 38,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: NeedlincColors.white,
                      border: Border.all(),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          value: value,
                          isExpanded: true,
                          hint: const Text('What do you do for a living?'),
                          items: occupations.map(occupationList).toList(),
                          onChanged: (value) =>
                              setState(() => this.value = value)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem occupationList(String work) => DropdownMenuItem(
        value: work,
        child: Text(
          work,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      );
}
