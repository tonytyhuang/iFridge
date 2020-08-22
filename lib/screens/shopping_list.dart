import 'package:flutter/material.dart';

class Shopping_List extends StatefulWidget {
  @override
  _Shopping_ListState createState() => _Shopping_ListState();
}

class _Shopping_ListState extends State<Shopping_List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin:EdgeInsets.only(top: 8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[ 
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