import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:from_css_color/from_css_color.dart';

void main() => runApp(const BooksApp());

ThemeData defaultTheme = ThemeData(
    primaryColor: fromCssColor('#0000FF'),
    textTheme: GoogleFonts.poppinsTextTheme()
);

class BooksApp extends StatelessWidget {
  const BooksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: defaultTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            leading: BackButton(
              onPressed: () {},
            ),
            title: const Text("Book List"),
            actions: <Widget>[
              PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return {'Logout', 'Settings'}.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              ),
            ]
        ),
        body: BooksListing(),
      ),
    );
  }
}

List bookData() {
  return [
    {
      'title': 'Book Title',
      'authors': ['Author1', 'Author3'],
    },
    {
      'title': 'Book Title 2',
      'authors': ['Author1'],
    }
  ];
}

class BooksListing extends StatelessWidget {
  final booksListing = bookData();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: booksListing == null ? 0 : booksListing.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${booksListing[index]['title']}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      booksListing[index]['authors'] != null
                          ? Text(
                        'Author(s): ${booksListing[index]['authors'].join(", ")}',
                        style: const TextStyle(fontSize: 14),
                      )
                          : const Text(""),
                    ],
                  ),
                ),
                booksListing[index]['image'] != null
                    ? Image.asset(
                  booksListing[index]['image'],
                  fit: BoxFit.fill,
                )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}