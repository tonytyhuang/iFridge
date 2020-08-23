import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            _buildTitle(),
            _subtitle(),
            _horizontalScroll(),
            _buildButtons(),
            _shoppingList(),
          ])),
    );
  }

  Widget _horizontalScroll() => Container(
      height: 200.0,
      child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0, left: 16.0),
          child: Container(
            width: 160.0,
            color: Colors.blue,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 160.0,
            color: Colors.red,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 160.0,
            color: Colors.green,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 160.0,
            color: Colors.orange,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 160.0,
            color: Colors.yellow,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 160.0,
            color: Colors.teal,
          ),
        ),
      ]));

  Widget _buildTitle() => Padding(
        padding: EdgeInsets.only(top: 16.0, left: 16.0),
        child: Text("iFridge",
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0)),
      );

  Widget _subtitle() => Padding(
        padding: EdgeInsets.only(left: 16.0, bottom: 8.0, top: 8.0),
        child: Row(
          children: <Widget>[
            Text(
              "Tony's Fridge Overview",
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.left,
            ),
            Padding(
              padding: EdgeInsets.only(left: 130.0),
              child: new GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'all_items');
                  },
                  child: new Text(
                    "See all",
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                    textAlign: TextAlign.right,
                  )),
            ),
          ],
        ),
      );
  Widget _buildButtons() => new Container(
          child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 150.0,
              width: 150.0,
              child: new RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.blueGrey)),
                child: new Text("Add Food"),
                color: Colors.blueAccent[600],
                onPressed: () => Navigator.pushNamed(context, 'input_screen'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
                height: 150.0,
                width: 150.0,
                child: new RaisedButton(
                    child: new Text("Recepies"),
                    color: Colors.blueAccent,
                    onPressed: () =>
                        Navigator.pushNamed(context, 'input_screen'))),
          )
        ],
      ));
  Widget _shoppingList() => Padding(
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
      );
} // End of class
