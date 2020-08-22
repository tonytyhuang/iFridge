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
            Padding(
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
            ),
            _horizontalScroll(),

            //Card Section
            SizedBox(
              height: 25,
            ),

            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () => Navigator.pushNamed(context, 'loginScreen'),
              child: Text(
                "Jackie's Button",
                style: TextStyle(fontSize: 20.0),
              ),
            ),

            // Padding(
            //   padding: EdgeInsets.only(left: 16.0, bottom: 16),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       Text("Tony's Fridge Overview", style: TextStyle(fontSize: 20.0),
            //       ),
            //     ],
            //   ),
            // ),

            //_horizontalScroll(),
            // ListView(
            //   scrollDirection:  Axis.horizontal,
            //   children: <Widget>[
            //     Container(
            //       width: 160.0,
            //       color: Colors.blue,
            //     ),
            //     Container(
            //       width: 160.0,
            //       color: Colors.red,
            //     ),
            //     Container(
            //       width: 160.0,
            //       color: Colors.green,
            //     ),

            //   ]

            // ),
            RaisedButton(
                onPressed: () => Navigator.pushNamed(context, 'input_screen'),
                child: const Text('Enter Items')),

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

             Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: FlatButton(
                color: Colors.lightBlue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black, 
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent, 
                onPressed: () => Navigator.pushNamed(context, 'all_items'),
                child: Text(
                  "All Items", 
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
          ]
        )
      ), 
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
} // End of class
