import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fridge_app/screens/home_screen.dart';

class AllItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          title: _buildTitle(),
          backgroundColor: Colors.blueGrey[900],
          elevation: 0.0,
        ),
        body: StreamBuilder(
            stream: getUserFoodSnap(context),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return new ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildFoodCard(context, snapshot.data.documents[index]));
            }));
  }

  Stream<QuerySnapshot> getUserFoodSnap(BuildContext context) async* {
    final uid = await FirebaseAuth.instance.currentUser();
    yield* Firestore.instance
        .collection('Users')
        .document(uid.uid)
        .collection('Food')
        .snapshots();
  }

  Widget buildFoodCard(BuildContext context, DocumentSnapshot document) {
    return new Container(
        child: Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
              child: Row(children: <Widget>[
                Text(
                  document['name'],
                  style: new TextStyle(fontSize: 30.0),
                ),
                Spacer(),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 80.0),
              child: Row(children: <Widget>[
                Text(
                  document['quantity'],
                  style: new TextStyle(fontSize: 30.0),
                ),
                Spacer(),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    document['expiration'],
                    style: new TextStyle(fontSize: 30.0),
                  ),
                  Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

Widget _buildTitle() => Padding(
      padding: EdgeInsets.only(top: 12.0),
      child: Text("iFridge",
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0)),
    );
