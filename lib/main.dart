import 'package:books_app/widget/books_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:from_css_color/from_css_color.dart';

void main() => runApp(const BooksApp());

ThemeData defaultTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: fromCssColor('#0000FF')
    ),
    textTheme: GoogleFonts.poppinsTextTheme()
);

class BooksApp extends StatelessWidget {
  const BooksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: defaultTheme,
      debugShowCheckedModeBanner: false,
      home: const BooksAppBar(['All', 'Education', 'Fantasy']),
    );
  }
}