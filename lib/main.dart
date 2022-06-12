import 'package:flutter/material.dart';
import 'package:yas_card_flutter/screens/books_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rentales',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.indigo,
      //   brightness: Brightness.dark,
      // ),
      home: BooksListScreen(),
    );
  }
}
