// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  // ignore: non_constant_identifier_names
  static ThemeData LightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.green,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: Theme.of(context).textTheme.bodySmall));

  // ignore: non_constant_identifier_names
  static ThemeData DarkTheme(BuildContext context) =>
      ThemeData(brightness: Brightness.dark);

//colors
  // ignore: use_full_hex_values_for_flutter_colors
  static Color creamColor = const Color.fromARGB(255, 225, 217, 217);
  static Color drakBulishColor = const Color(0xff403b58);
}
