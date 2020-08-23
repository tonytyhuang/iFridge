import 'package:flutter/material.dart';
import 'package:fridge_app/screens/main_drawer.dart';
import 'package:fridge_app/services/auth.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.lightBlueAccent[400],
        elevation: 0.0,
      ),
      endDrawer: MainDrawer(),
      body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            _buildTitle(),
            _subtitle(),
            _seeMore(),
            _horizontalScroll(),
            new Container(
                child: new Row(
              children: <Widget>[
                new RaisedButton(
                  child: new Text("Add Food"),
                  color: Colors.blueAccent[600],
                  onPressed: () => Navigator.pushNamed(context, 'input_screen'),
                ),
                new RaisedButton(
                    child: new Text("Recepies"),
                    color: Colors.blueAccent,
                    onPressed: () =>
                        Navigator.pushNamed(context, 'input_screen'))
              ],
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: FlatButton(
                color: Colors.lightBlue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () => Navigator.pushNamed(context, 'shopping_list'),
                child: Text(
                  "Shopping List",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
          ])),
    );
  }

  Widget _horizontalScroll() => Container(
      height: 200.0,
      child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
        Container(
          width: 160.0,
          color: Colors.blue,
        ),
        Container(
          width: 160.0,
          color: Colors.red,
        ),
        Container(
          width: 160.0,
          color: Colors.green,
        ),
        Container(
          width: 160.0,
          color: Colors.orange,
        ),
        Container(
          width: 160.0,
          color: Colors.yellow,
        ),
        Container(
          width: 160.0,
          color: Colors.teal,
        ),
      ]));

  Widget _buildTitle() => Padding(
        padding: EdgeInsets.only(top: 8.0, left: 16.0),
        child: Text("iFridge",
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0)),
      );

  Widget _seeMore() => Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: new GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'all_items');
            },
            child: new Text(
              "See all...",
              style: TextStyle(color: Colors.black, fontSize: 20.0),
              textAlign: TextAlign.right,
            )),
      );

  Widget _subtitle() => Padding(
        padding: EdgeInsets.only(left: 8.0, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Tony's Fridge Overview",
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      );
} // End of class
