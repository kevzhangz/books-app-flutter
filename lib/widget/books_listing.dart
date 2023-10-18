import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    if(mounted){
      setState(() {
        booksResponse = response["items"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: booksResponse == null ? 0 : booksResponse.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                booksResponse[index]['volumeInfo']['imageLinks']['thumbnail'] != null
                ? Image.network(
                    booksResponse[index]['volumeInfo']['imageLinks']['thumbnail'],
                    fit: BoxFit.fill,
                  )
                : Container(),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booksResponse[index]['volumeInfo']['title'],
                        style: const TextStyle(fontWeight: FontWeight.bold)
                      ),
                      const SizedBox(height: 5),
                      booksResponse[index]['volumeInfo']['authors'] != null ? Text("Authors: ${booksResponse[index]['volumeInfo']['authors'].join(", ")}") : const Text(""),
                    ],
                  )
                )
              ],
            ),
          );
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

  //This will print `flutter: Instance of 'Response'` on console.
  return jsonDecode(response.body);
}