import 'package:flutter/material.dart';

import 'package:books_app/widget/books.dart';
import 'package:books_app/widget/books_detail.dart';
import 'package:books_app/widget/page_not_found.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

void main() => runApp(const BooksApp());

class ThemeClass {
  Color lightPrimaryColor = HexColor('#FFFFFF');
  Color darkPrimaryColor = HexColor('#09182D');
  Color secondaryColor = HexColor('#ffffff');
  Color accentColor = HexColor('#5b5b5b');
  Color descLight = HexColor('#FFFFFF');
  Color descDark = HexColor('#182B49');

  static ThemeData lightTheme = ThemeData(
      primaryColor: ThemeData.light().scaffoldBackgroundColor,
      colorScheme: const ColorScheme.light().copyWith(
          primary: _themeClass.lightPrimaryColor,
          secondary: _themeClass.secondaryColor),
      textTheme: GoogleFonts.poppinsTextTheme());
  static ThemeData darkTheme = ThemeData(
      primaryColor: ThemeData.dark().scaffoldBackgroundColor,
      colorScheme: const ColorScheme.dark().copyWith(
          primary: _themeClass.darkPrimaryColor,
          secondary: _themeClass.accentColor));
}

///////
// ThemeData defaultTheme = ThemeData(
//     colorScheme: ColorScheme.fromSeed(
//         seedColor: HexColor('#0000FF'), primary: HexColor('#0000FF')),
//     textTheme: GoogleFonts.poppinsTextTheme());
//////
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
      // darkTheme: ThemeData.dark(),
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
      route = MaterialPageRoute(
        builder: (context) => BookDetailsPage(args),
      );
      break;

    default:
      route = MaterialPageRoute(builder: (context) => const PageNotFound());
      break;
  }

  return route;
}

ThemeClass _themeClass = ThemeClass();
