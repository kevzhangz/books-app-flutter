import 'package:flutter/material.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage(this.book, {super.key});

  final book;

  @override
  Widget build(BuildContext context) {
    //Added Scaffold
    return Scaffold(
      //Buat Warna Background
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
      ),
      // Foto Tengah
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Text(
                  book['volumeInfo']['title'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white)
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(left: 45, right: 45),
              child: Text(book['volumeInfo']['authors'].join(", "),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white)
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30),
              height: 300,
              width: 150,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(book['volumeInfo']['imageLinks']['thumbnail'], fit: BoxFit.fill)
              ),
            ),
            const SizedBox(height: 40),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  const TextSpan(text:'Category', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "\n${book['volumeInfo']['categories'] != null ? book['volumeInfo']['categories'][0] : ''}"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      const TextSpan(text:'Language', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: "\n ${book['volumeInfo']['language']}"),
                    ],
                  ),
                ),
                const SizedBox(height: 55),
                const SizedBox(width: 85),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      const TextSpan(text:'Published', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: "\n ${book['volumeInfo']['publishedDate']}"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}