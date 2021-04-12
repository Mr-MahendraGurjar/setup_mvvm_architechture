import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  final CollectionReference dataReference =
      FirebaseFirestore.instance.collection('users');
  Stream<QuerySnapshot> getData() {
    return dataReference.snapshots();
  }
}
