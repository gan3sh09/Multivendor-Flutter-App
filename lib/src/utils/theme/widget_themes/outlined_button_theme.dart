import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class MarketHubOutlinedButtonTheme {
  MarketHubOutlinedButtonTheme._(); // To avoid creating instances

  /* Light Theme */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: marketHubSecondaryColor,
      side: const BorderSide(color: marketHubSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: marketHubButtonHeight),
    ),
  );

  /* Dark Theme */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: marketHubWhiteColor,
      side: const BorderSide(color: marketHubWhiteColor),
      padding: const EdgeInsets.symmetric(vertical: marketHubButtonHeight),
    ),
  );
}
