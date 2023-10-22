import 'package:flutter/material.dart';
import 'package:books_app/widget/books_listing.dart';
import 'package:hexcolor/hexcolor.dart';

class Books extends StatefulWidget {
  const Books(this.list, {super.key});

  final List list;

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  final darkblue = HexColor('#00007C');

  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: widget.list.length,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            elevation: 0,
            centerTitle: true,
            leading: BackButton(
              onPressed: () {},
            ),
            title: const Text("Book List"),
            actions: <Widget>[
              PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return {'Light Mode', 'Dark Mode'}.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              ),
            ],
            bottom: const TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 5,
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'All'),
                Tab(text: 'Education'),
                Tab(text: 'Fantasy'),
              ]
            )
        ),
        body: const TabBarView(
          children: [
            BooksListing("Programming"),
            BooksListing("Education"),
            BooksListing("Fantasy"),
          ],
        )
      ),
    );
  }
}