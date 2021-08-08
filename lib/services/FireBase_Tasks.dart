import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('ToDoTasks');

class Database {
  static String userUid;

  Future<void> addItem({@required String task}) async {
    _firestore.collection("ToDoTasks").add({'task': task});
  }

  Stream<QuerySnapshot> get tasks {
    return _mainCollection.snapshots();
  }
}
