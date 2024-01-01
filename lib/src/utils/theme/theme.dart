import 'package:flutter/material.dart';
import 'package:market_hub/src/utils/theme/widget_themes/appbar_theme.dart';
import 'package:market_hub/src/utils/theme/widget_themes/bottom_navigation_bar_theme.dart';
import 'package:market_hub/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:market_hub/src/utils/theme/widget_themes/floating_action_button_theme.dart';
import 'package:market_hub/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:market_hub/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:market_hub/src/utils/theme/widget_themes/text_theme.dart';

class MarketHubAppTheme {

  MarketHubAppTheme._();
  
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: MarketHubTextTheme.lightTextTheme,
    outlinedButtonTheme: MarketHubOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: MarketHubElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TextFormFieldTheme.lightInputDecorationTheme,
    appBarTheme: MarketHubAppBarTheme.lightAppBarTheme,
    floatingActionButtonTheme: MarketHubFloatingActionButtonTheme.lightFloatingActionButtonTheme,
    bottomAppBarTheme: MarketHubBottomNavigationBarTheme.lightBottomNavigationBarTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: MarketHubTextTheme.darkTextTheme,
    outlinedButtonTheme: MarketHubOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: MarketHubElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TextFormFieldTheme.darkInputDecorationTheme,
    appBarTheme: MarketHubAppBarTheme.darkAppBarTheme,
    floatingActionButtonTheme: MarketHubFloatingActionButtonTheme.darkFloatingActionButtonTheme,
    bottomAppBarTheme: MarketHubBottomNavigationBarTheme.darkBottomNavigationBarTheme,
  );
}