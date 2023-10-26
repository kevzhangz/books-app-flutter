import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';



class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage(this.book, {super.key});

  final book;

  Future<dynamic> _launchUrl(url) async {
    final parsedUrl = Uri.parse(url);
    if (!await launchUrl(parsedUrl)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final orange = HexColor('#F39C12');
    final darkblue = HexColor("#00007C");
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
        child: ListView(
          children: [
            Column(
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
                          TextSpan(text: "\n ${book['volumeInfo']['language'] == 'id' ? 'Indonesia' : 'English'}"),
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
                          TextSpan(text: "\n ${book['volumeInfo']['publishedDate'] ?? '-'}"),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0)),
                  child: Container(
                    width: width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const Center(
                          child: Text("Synopsis", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
                          child: Text(book['volumeInfo']['description']),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () => _launchUrl(book['volumeInfo']['previewLink']),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: darkblue,
                                padding: const EdgeInsets.only(top: 12, bottom: 12, left: 30, right: 30),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                              child: const Text("Read now"),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () => _launchUrl(book['volumeInfo']['infoLink']),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: orange,
                                padding: const EdgeInsets.only(top: 12, bottom: 12, left: 30, right: 30),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                              child: const Text("Buy now"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


