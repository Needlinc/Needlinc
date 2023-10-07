import 'package:flutter/material.dart';
import '../colors/colors.dart';

class Borders {
  static final EnabledBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: NeedlincColors.black1,
    ),
    borderRadius: BorderRadius.zero,
  );
  static final FocusedBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: NeedlincColors.blue1,
    ),
    borderRadius: BorderRadius.zero,
  );
}
