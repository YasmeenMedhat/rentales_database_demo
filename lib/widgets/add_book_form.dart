import 'package:flutter/material.dart';
import 'package:yas_card_flutter/utils/database.dart';
import 'package:yas_card_flutter/utils/validator.dart';

import 'custom_form_field.dart';

class AddBookForm extends StatefulWidget {
  final FocusNode nameFocusNode;
  final FocusNode authorFocusNode;
  final FocusNode publishedYearFocusNode;

  const AddBookForm({
    required this.nameFocusNode,
    required this.authorFocusNode,
    required this.publishedYearFocusNode,
  });

  @override
  _AddBookFormState createState() => _AddBookFormState();
}

class _AddBookFormState extends State<AddBookForm> {
  final _addBookFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _publishedYearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addBookFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 24.0,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.0),

                Text('Name', style: TextStyle(color: Colors.teal, fontSize: 18.0,),),
                SizedBox(height: 5.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _nameController,
                  focusNode: widget.nameFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Name',
                  hint: 'Enter your book name',
                ),
                SizedBox(height: 15.0),

                Text('Author', style: TextStyle(color: Colors.teal, fontSize: 18.0,),),
                SizedBox(height: 5.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _authorController,
                  focusNode: widget.authorFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(value: value,),
                  label: 'Author',
                  hint: 'Enter your author name',
                ),
                SizedBox(height: 15.0),

                Text('Published Year', style: TextStyle(color: Colors.teal, fontSize: 18.0,),),
                SizedBox(height: 5.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _publishedYearController,
                  focusNode: widget.publishedYearFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Published Year',
                  hint: 'published year',
                ),
                SizedBox(height: 15.0),
              ],
            ),
          ),
          _isProcessing
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.teal,),
                  ),
                )
              : Container(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal,),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                      ),
                    ),
                    onPressed: () async {
                      widget.nameFocusNode.unfocus();
                      widget.authorFocusNode.unfocus();
                      widget.publishedYearFocusNode.unfocus();

                      if (_addBookFormKey.currentState!.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.addItem(
                          name: _nameController.text,
                          author: _authorController.text,
                          publishedYear: _publishedYearController.text,
                        );

                        setState(() {
                          _isProcessing = false;
                        });

                        Navigator.of(context).pop();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                      child: Text('ADD BOOK', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,),),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
