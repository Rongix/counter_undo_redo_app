import 'package:flutter/material.dart';

/// Name every globals like:
/// globalXxxxYyyyy
/// globalMyFavoriteVar

/// //////////////////////////////////////////////////////
/// THEMES - Light
ThemeData globalLightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.grey[200],
);

/// //////////////////////////////////////////////////////
/// THEMES - Dark
ThemeData globalDarkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.grey[900],
);
