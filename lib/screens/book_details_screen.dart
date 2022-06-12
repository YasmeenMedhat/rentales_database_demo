import 'package:flutter/material.dart';
import 'package:yas_card_flutter/widgets/add_book_form.dart';

class BookDetailsScreen extends StatelessWidget {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();
  final FocusNode _publishedYearFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
        _publishedYearFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey,
          title: Text('Rentales'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: AddBookForm(
              nameFocusNode: _titleFocusNode,
              authorFocusNode: _descriptionFocusNode,
              publishedYearFocusNode: _publishedYearFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
