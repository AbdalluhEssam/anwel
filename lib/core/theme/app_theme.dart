import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';


class AppTheme {
 static ThemeData get lightTheme => ThemeData(
   primaryColor: AppColor.primaryColor,
   scaffoldBackgroundColor: AppColor.white,
   fontFamily: GoogleFonts.rubik().fontFamily,
   brightness: Brightness.light,
   appBarTheme: const AppBarTheme(
     backgroundColor: AppColor.white,
     elevation: 0,
     centerTitle: true,
     iconTheme: IconThemeData(color: AppColor.black),
     titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.black),
   ),
 );


 static ThemeData get darkTheme => ThemeData(
   primaryColor: AppColor.primaryColor,
   scaffoldBackgroundColor: Colors.black,
   fontFamily: GoogleFonts.rubik().fontFamily,
   brightness: Brightness.dark,
   appBarTheme: const AppBarTheme(
     backgroundColor: Colors.black,
     elevation: 0,
     centerTitle: true,
     iconTheme: IconThemeData(color: AppColor.white),
     titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.white),
   ),
 );
}
