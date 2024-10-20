import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  // call the collection
  final crabs = FirebaseFirestore.instance.collection('crabData');
  // call the storage
  final storage = FirebaseStorage.instance.ref;
}
