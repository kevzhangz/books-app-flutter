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
              book['volumeInfo']['imageLinks'] != null
              ? Image.network(
                  book['volumeInfo']['imageLinks']['thumbnail'],
                  fit: BoxFit.fill,
                )
              : Image.asset(
                "assets/images/noImage.png",
                width: 100,
                fit: BoxFit.fill,
              ),
              const SizedBox(width: 5),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          book['volumeInfo']['title'],
                      ),
                      const SizedBox(height: 5)
                    ],
                  ),
              ),
            ],
          ),
        );
  }
}