import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('books');

class Database {
  static String? userUid;

  static Future<void> addItem({
    required String name,
    required String author,
    required String publishedYear,

  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('books').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "author": author,
      "published year": publishedYear,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note book added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    required String name,
    required String author,
    required String publishedYear,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('books').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "author": author,
      "published year": publishedYear,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(userUid).collection('books');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('books').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }
}
