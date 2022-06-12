import 'package:flutter/material.dart';
import 'package:yas_card_flutter/screens/book_details_screen.dart';
import 'package:yas_card_flutter/widgets/book_details.dart';

class BooksListScreen extends StatefulWidget {
  @override
  _BooksListScreenState createState() => _BooksListScreenState();
}

class _BooksListScreenState extends State<BooksListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text("Books List"),
          backgroundColor: Colors.teal,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BookDetailsScreen(),
            ),
          );
        },
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: BookDetails(),
        ),
      ),
    );
  }
}
