import 'package:flutter/material.dart';

const primaryColor = Color(0xFF009AD1);
const grayColor = Color(0xFF666666);
const colorAccent = Color.fromARGB(255, 230, 246, 244);
const lightGray = Color(0xFFcccccc);

const List<Color> fixedColors = [
  Color(0xFF1E88E5),
  Color(0xFFD32F2F),
  Color(0xFF43A047),
  Color(0xFFFBC02D),
  Color(0xFF8E24AA),
  Color(0xFF3949AB),
  Color(0xFF00ACC1),
  Color(0xFFFB8C00),
  Color(0xFF6D4C41),
  Color(0xFF546E7A),
];

BoxShadow shadow = BoxShadow(
  color: Colors.grey.withOpacity(0.2),
  spreadRadius: 0.4,
  blurRadius: 1,
  offset: const Offset(0, 1),
);
ThemeData lightTheme = ThemeData(
  useMaterial3: false,
  tabBarTheme: const TabBarTheme(
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: primaryColor,
        width: 2,
      ),
    ),
  ),
  brightness: Brightness.light,
  primaryColor: primaryColor,
  secondaryHeaderColor: colorAccent,
  dividerColor: lightGray,
  fontFamily: 'Montserrat',
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      color: Colors.black87,
      fontSize: 12,
    ),
    bodyMedium: TextStyle(
      color: Colors.black87,
      fontSize: 16,
    ),
    bodyLarge: TextStyle(
      color: Colors.black87,
      fontSize: 20,
    ),
    titleMedium: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    headlineSmall: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    headlineMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    headlineLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 0,
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: false,
  tabBarTheme: const TabBarTheme(
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: primaryColor,
        width: 2,
      ),
    ),
  ),
  brightness: Brightness.dark,
  primaryColor: primaryColor,
  secondaryHeaderColor: Color(0x1E1E1EFF),
  dividerColor: Color(0xFF515151),
  fontFamily: 'Montserrat',
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      color: Colors.white,
      fontSize: 12,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
    titleMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    headlineSmall: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    headlineMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    headlineLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
  ),
  scaffoldBackgroundColor: const Color(0xFF121212),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF121212),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF121212),
    elevation: 0,
  ),
);
