import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yas_card_flutter/utils/database.dart';

class BookDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.readItems(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 16.0),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var bookInfo = snapshot.data!.docs[index].data()!;
              String docID = snapshot.data!.docs[index].id;
              String title = bookInfo['title'];
              String description = bookInfo['description'];

              return Ink(
                decoration: BoxDecoration(
                  color: Colors.tealAccent,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  title: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.teal,
            ),
          ),
        );
      },
    );
  }
}
