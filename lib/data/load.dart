import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veggy/data/data.dart';

class LoadData {
  static CollectionReference users =
      FirebaseFirestore.instance.collection('products');
  static void load() {
    users
        .doc('listProducts')
        .set({
          'list': datamock,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
