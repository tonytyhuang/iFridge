import 'package:flutter/material.dart';
import 'package:fridge_app/screens/main_drawer.dart';
import 'package:fridge_app/left_right_alignment.dart';

class Shopping_List extends StatefulWidget {
  @override
  _Shopping_ListState createState() => _Shopping_ListState();
}

class _Shopping_ListState extends State<Shopping_List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: _buildTitle(),
        backgroundColor: Colors.blueGrey[900],
        elevation: 0.0,
      ),
      endDrawer: MainDrawer(),
      body: Container(
        child: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
              _subtitle(),
              _horizontalScroll(),
              //_listOfItems(),
            ])),
      ),
    );
  }

  List<String> items = ["Item 1", "Item 2", "Item 3"];

  Widget _listOfItems() => ReorderableListView(
        children: <Widget>[
          for (final value in items)
            Text(
              value,
              key: Key(value),
              style: TextStyle(fontSize: 22.0),
            )
        ],
        onReorder: (OldIndex, NewIndex) {
          setState(() {
            if (OldIndex < NewIndex) {
              NewIndex -= 1;
            }
            var getReplaceWidget = items.removeAt(OldIndex);
            items.insert(NewIndex, getReplaceWidget);
          });
        },
      );

  Widget _horizontalScroll() => Container(
      height: 160.0,
      child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(right: 4.0, top: 8.0, bottom: 8.0, left: 16.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 3),
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blue[100],
            ),
            width: 160.0,
            child: Stack(
              children: [
                Positioned(
                  bottom: 57,
                  left: 38,
                  child: Image(
                    image: AssetImage("assets/images/apple.png"),
                    width: 80,
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 35,
                  child: Center(
                    child: Text(
                      "Apple (3)",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 15,
                  child: Center(
                    child: Text(
                      "Expires in 10 days",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: 4.0, top: 8.0, bottom: 8.0, left: 12.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 3),
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.red[100],
            ),
            width: 160.0,
            child: Stack(
              children: [
                Positioned(
                  bottom: 45,
                  left: 22,
                  child: Image(
                    image: AssetImage("assets/images/meat.png"),
                    width: 110,
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 12,
                  child: Center(
                    child: Text(
                      "Pork Chop (2)",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 18,
                  child: Center(
                    child: Text(
                      "Expires in 4 days",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: 4.0, top: 8.0, bottom: 8.0, left: 12.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 3),
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.green[100],
            ),
            width: 160.0,
            child: Stack(
              children: [
                Positioned(
                  bottom: 40,
                  left: 18,
                  child: Image(
                    image: AssetImage("assets/images/banana.png"),
                    width: 110,
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 26,
                  child: Center(
                    child: Text(
                      "Banana (7)",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 19,
                  child: Center(
                    child: Text(
                      "Expires in 6 days",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: 4.0, top: 8.0, bottom: 8.0, left: 12.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.yellow, width: 3),
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.yellow[100],
            ),
            width: 160.0,
            child: Stack(
              children: [
                Positioned(
                  bottom: 55,
                  left: 45,
                  child: Image(
                    image: AssetImage("assets/images/carrot.png"),
                    width: 85,
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 32,
                  child: Center(
                    child: Text(
                      "Carrot (2)",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 19,
                  child: Center(
                    child: Text(
                      "Expires in 6 days",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]));
  Widget _buildTitle() => Padding(
        padding: EdgeInsets.only(top: 12.0),
        child: Text("Shopping List",
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
      );
  Widget _subtitle() => Padding(
        padding: const EdgeInsets.all(10.0),
        child: LeftRightAlign(
            left: Text("What You Have", style: TextStyle(fontSize: 25.0)),
            right: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'all_items');
                },
                child: Text('See more',
                    style: TextStyle(fontSize: 15.0), textAlign: TextAlign.end),
              ),
            )),
      );
}
