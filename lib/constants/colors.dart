import 'package:flutter/material.dart';

const textColor = Color(0xFF1A0E04);
const backgroundColor = Color(0xFFFDF6F1);
const primaryColor = Color(0xFFFF7300);
const secondaryColor = Color(0xFF011F4B);
const accentColor = Color(0xFF5DE686);

const colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: primaryColor,
  onPrimary: primaryColor,
  secondary: secondaryColor,
  onSecondary: secondaryColor,
  background: backgroundColor,
  onBackground: textColor,
  surface: backgroundColor,
  onSurface: textColor,
  error: Brightness.light == Brightness.light
      ? Color(0xffB3261E)
      : Color(0xffF2B8B5),
  onError: Brightness.light == Brightness.light
      ? Color(0xffFFFFFF)
      : Color(0xff601410),
);
