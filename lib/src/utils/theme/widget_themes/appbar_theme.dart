import 'package:flutter/material.dart';
import 'package:market_hub/src/constants/colors.dart';

class MarketHubAppBarTheme {
  MarketHubAppBarTheme._();

  /* Light Theme */
  static const lightAppBarTheme = AppBarTheme(
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    
  );

  /* Dark Theme */
  static const darkAppBarTheme = AppBarTheme(
    backgroundColor: Colors.black38,
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: marketHubPrimaryColor),
  );
}
