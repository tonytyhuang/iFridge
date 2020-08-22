import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin:EdgeInsets.only(top: 8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[ 
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
              onPressed: () => Navigator.pushNamed(context, 'wrapper'),
              child: Text(
                "Jackie's Button", 
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Good Morning'),
                  Text('Tony Huang')
                ],
              ),
            )
          ]
        )
      ), 
    );
  }
}