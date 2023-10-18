import 'package:flutter/material.dart';
import 'package:books_app/widget/books_listing.dart';

class Books extends StatefulWidget {
  const Books(this.list, {super.key});

  final List list;

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: widget.list.length,
      child: Scaffold(
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