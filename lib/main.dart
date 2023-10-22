import 'package:flutter/material.dart';

import 'package:books_app/widget/books.dart';
import 'package:books_app/widget/books_detail.dart';
import 'package:books_app/widget/page_not_found.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

void main() => runApp(const BooksApp());

ThemeData defaultTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: HexColor('#0000FF'),
      primary: HexColor('#0000FF')
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
      home: const Books(['All', 'Education', 'Fantasy']),
      initialRoute: '/',
      onGenerateRoute: routeList,
    );
  }
}

Route<dynamic> routeList(RouteSettings routeSettings){
  final args = routeSettings.arguments;
  final Route<dynamic> route;

  switch (routeSettings.name) {
    case '/':
      route = MaterialPageRoute(
        builder: (context) => const Books(['All', 'Education', 'Fantasy']),
      );
      break;
    case '/details':
      route = MaterialPageRoute(
        builder: (context) => BookDetailsPage(args),
      );
      break;
    
    default:
      route = MaterialPageRoute(
        builder: (context) => const PageNotFound()
      );
      break;
  }

  return route;
}