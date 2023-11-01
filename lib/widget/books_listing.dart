import 'package:books_app/model/book.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:books_app/widget/booktile.dart';

class BooksListing extends StatefulWidget {
  const BooksListing(this.query, {super.key});

  final String query;

  @override
  _BooksListingState createState() => _BooksListingState();
}

class _BooksListingState extends State<BooksListing> {
  //method to fetch books asynchronously
  late dynamic booksResponse;
  @override
  void initState() {
    booksResponse = '';
    super.initState();
    fetchBooks(widget.query);
  }

  fetchBooks(query) async {
    //making REST API call
    var response = await makeHttpCall(query);

    //Updating booksResponse to fetched remote data
    if (mounted) {
      setState(() {
        booksResponse = response;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: ListView.builder(
        itemCount: booksResponse == null ? 0 : booksResponse.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              child: BookTile(booksResponse[index]),
              onTap: () => Navigator.pushNamed(context, '/details',
                  arguments: booksResponse[index]));
        },
      ),
    );
  }
}

makeHttpCall(query) async {
  const apiKey = "AIzaSyB5jYhEH5EgLoNcNPdfazjr-3fKA2s8L5Y";
  final apiEndpoint =
      "https://www.googleapis.com/books/v1/volumes?key=$apiKey&q=$query";
  final http.Response response = await http
      .get(Uri.parse(apiEndpoint), headers: {'Accept': 'application/json'});

  final jsonObject = jsonDecode(response.body);

  final list = jsonObject['items'] as List;

  return list.map((e) => BookModel.fromJson(e)).toList();
}
