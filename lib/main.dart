import 'package:books_app/model/book.dart';
import 'package:flutter/material.dart';

import 'package:books_app/widget/books.dart';
import 'package:books_app/widget/books_detail.dart';
import 'package:books_app/widget/page_not_found.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

void main() => runApp(const BooksApp());

class ThemeClass {
  Color white = HexColor('#FFFFFF');
  Color darkBlueBlack = HexColor('#09182D');
  Color spaceCadet = HexColor('#182B49');
  Color blue = HexColor('#0000FF');
  Color darkBlue = HexColor('#0000fc');
  Color black = HexColor('#000000');
  Color orangePeel = HexColor('#f39c12');
  Color darkOrange = HexColor('#b67610');

  static ThemeData lightTheme = ThemeData(
      primaryColor: ThemeData.light().scaffoldBackgroundColor,
      colorScheme: const ColorScheme.light().copyWith(
          primary: _themeClass.white,
          secondary: _themeClass.white,
          surface: _themeClass.blue,
          tertiary: _themeClass.darkBlue,
          scrim: _themeClass.orangePeel,
          onTertiary: _themeClass.black),
      textTheme: TextTheme(headline6: TextStyle(color: Colors.black)));
  static ThemeData darkTheme = ThemeData(
      primaryColor: ThemeData.dark().scaffoldBackgroundColor,
      colorScheme: const ColorScheme.dark().copyWith(
          primary: _themeClass.darkBlueBlack,
          secondary: _themeClass.spaceCadet,
          surface: _themeClass.darkBlueBlack,
          tertiary: _themeClass.darkBlueBlack,
          scrim: _themeClass.darkOrange,
          onTertiary: _themeClass.white),
      textTheme: TextTheme(headline6: TextStyle(color: Colors.white)));
}

class BooksApp extends StatefulWidget {
  const BooksApp({super.key});

  @override
  _BooksAppState createState() => _BooksAppState();

  /// InheritedWidget style accessor to our State object.
  /// We can call this static method from any descendant context to find our
  /// State object and switch the themeMode field value & call for a rebuild.
  static _BooksAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_BooksAppState>()!;
}

class _BooksAppState extends State<BooksApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeClass.lightTheme,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeClass.darkTheme,
      themeMode: _themeMode,
      home: const Books(['All', 'Education', 'Fantasy']),
      initialRoute: '/',
      onGenerateRoute: routeList,
    );
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
}

Route<dynamic> routeList(RouteSettings routeSettings) {
  final args = routeSettings.arguments;
  final Route<dynamic> route;

  switch (routeSettings.name) {
    case '/':
      route = MaterialPageRoute(
        builder: (context) => const Books(['All', 'Education', 'Fantasy']),
      );
      break;
    case '/details':
      if(args is BookModel){
        route = MaterialPageRoute(
          builder: (context) => BookDetailsPage(book: args),
        );
      } else {
        route = MaterialPageRoute(builder: (context) => const PageNotFound());
      }
      break;
    default:
      route = MaterialPageRoute(builder: (context) => const PageNotFound());
      break;
  }

  return route;
}

ThemeClass _themeClass = ThemeClass();
