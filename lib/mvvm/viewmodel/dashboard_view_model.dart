import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:setup_mvvm_architechture/services/cloud_firestore.dart';
import 'package:stacked/stacked.dart';

class DashboardScreenModel extends StreamViewModel<QuerySnapshot> {
  final FirestoreServices firestoreServices = FirestoreServices();

  @override
  Stream<QuerySnapshot> get stream => getStreamFromFireStore();

  Stream<QuerySnapshot> getStreamFromFireStore() {
    return firestoreServices.getData();
  }
}
