import 'package:cloud_firestore/cloud_firestore.dart';

final _friestore = Firestore.instance;

final userRef = _friestore.collection('users');