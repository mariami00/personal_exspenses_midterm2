import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collectionReference = _firestore.collection("notes");

class Database {
  static String? userID;

  //save data
  static Future<void> addItem({required String title, required String description, required String amount}) async {
    DocumentReference documentReference = _collectionReference.doc(userID).collection("items").doc();

    var data=<String, dynamic>{
      "title" : title,
      "description" : description,
      "amount" : amount,
    };

    await documentReference
        .set(data)
        .whenComplete(() => print("Item is added to the database"))
        .catchError((e) => print(e));
  }

  //read data
  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesReference = _collectionReference.doc(userID).collection("items");

    return notesReference.snapshots();
  }

  //update data
  static Future<void> updateItem({required String title, required String description, required String amount, required String docId}) async {
    DocumentReference documentReference = _collectionReference.doc(userID).collection("items").doc(docId);

    var data = <String, dynamic>{
      "title" : title,
      "description" : description,
      "amount" : amount
    };

    await documentReference
        .update(data)
        .whenComplete(() => print("Update successfully"))
        .catchError((e) => print(e));
  }

  static Future<void> deleteItem({required String docId}) async {
    DocumentReference documentReference = _collectionReference.doc(userID).collection("items").doc(docId);


    await documentReference
        .delete()
        .whenComplete(() => print("Item successfully deleted"))
        .catchError((e) => print(e));
  }

}
