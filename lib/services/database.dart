import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference users = Firestore.instance.collection('Users');

  Future<void> addUserDatabase() async {
    return await users.document(uid).collection('Food').document().setData({});
  }
}
