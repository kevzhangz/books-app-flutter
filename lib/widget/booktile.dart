import 'package:flutter/material.dart';


class BookTile extends StatelessWidget {
  const BookTile(this.book, {super.key});
  final book;

  @override
  Widget build(BuildContext context) {
  return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              book['volumeInfo']['imageLinks']['thumbnail'] != null
              ? Image.network(
                  book['volumeInfo']['imageLinks']['thumbnail'],
                  fit: BoxFit.fill,
                )
              : Container(),
            ],
          ),
        );
  }
}