import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class MarketHubElevatedButtonTheme {
  MarketHubElevatedButtonTheme._();

  /* Light Theme */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: marketHubWhiteColor,
      backgroundColor: marketHubSecondaryColor,
      side: const BorderSide(color: marketHubSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: marketHubButtonHeight),
    ),
  );

  /* Dark Theme */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: marketHubSecondaryColor,
      backgroundColor: marketHubWhiteColor,
      side: const BorderSide(color: marketHubSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: marketHubButtonHeight),
    ),
  );
}
