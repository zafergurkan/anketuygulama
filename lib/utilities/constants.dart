import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final _friestore = Firestore.instance;
final storageRef = FirebaseStorage.instance.ref();
final userRef = _friestore.collection('users');