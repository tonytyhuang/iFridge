import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fridge_app/screens/home_screen.dart';

class AllItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          title: _buildTitle(),
          backgroundColor: Colors.blueGrey[900],
          elevation: 0.0,
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: StreamBuilder(
                stream: getUserFoodSnap(context),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return new GridView.builder(
                      itemCount: snapshot.data.documents.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          crossAxisCount:
                              (orientation == Orientation.portrait) ? 2 : 3),
                      itemBuilder: (BuildContext context, int index) =>
                          buildFoodCard(
                              context, snapshot.data.documents[index]));
                })));
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
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 4),
          borderRadius: BorderRadius.circular(0.0),
          color: Colors.blue[100],
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  right: 16.0, top: 12.0, bottom: 24.0, left: 16.0),
              child: Row(children: <Widget>[
                Text(
                  document['name'],
                  style: new TextStyle(fontSize: 25.0),
                ),
                Spacer(),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 16.0, top: 4.0, bottom: 8.0, left: 16.0),
              child: Row(children: <Widget>[
                Text(
                  document['quantity'],
                  style: new TextStyle(fontSize: 25.0),
                ),
                Spacer(),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 16.0, top: 4.0, bottom: 8.0, left: 16.0),
              child: Row(
                children: <Widget>[
                  Text(
                    document['expiration'],
                    style: new TextStyle(fontSize: 25.0),
                  ),
                  Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    )));
  }
}

Widget _buildTitle() => Padding(
      padding: EdgeInsets.only(top: 12.0),
      child: Text("Food Items",
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0)),
    );
