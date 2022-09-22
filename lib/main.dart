import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitch_design/features/landing_page/landing_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitch',
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: GoogleFonts.montserrat(
            color: const Color(0xffffffff),
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 30.0,
          ),
          titleMedium: GoogleFonts.montserrat(
            color: const Color(0xff000000),
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 28.0,
          ),
          bodyMedium: GoogleFonts.montserrat(
            color: const Color(0xffffffff),
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 24.0,
          ),
          bodySmall: GoogleFonts.montserrat(
            color: const Color(0xff000000),
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 18.0,
          ),
        ),
      ),
      home: const LandingPage(),
    );
  }
}
