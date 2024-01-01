import 'package:flutter/material.dart';
import 'package:market_hub/src/constants/colors.dart';

class TextFormFieldTheme {
  TextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: marketHubSecondaryColor,
    floatingLabelStyle: TextStyle(color: marketHubSecondaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: marketHubSecondaryColor),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: marketHubPrimaryColor,
    floatingLabelStyle: TextStyle(color: marketHubPrimaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: marketHubPrimaryColor),
    ),
  );
}
