import 'package:flutter/material.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage(this.book, {super.key});

  final book;

  @override
  Widget build(BuildContext context) {
    //Added Scaffold
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(book['volumeInfo']['title']),
      ),
      body: const Center(
        child: Text("Book description"),
      ),
    );
  }
}