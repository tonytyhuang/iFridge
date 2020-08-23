import 'package:flutter/material.dart';
import 'package:fridge_app/left_right_alignment.dart';
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
        toolbarHeight: 90,
        title: _buildTitle(),
        backgroundColor: Color(0xFF06161d),
        elevation: 0.0,
      ),
      endDrawer: MainDrawer(),
      body: Container(
        child: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
              Stack(
                children: [
                  ClipPath(
                    clipper: MyClipper2(),
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFf57900), Color(0xFFf6ad34)],
                        ),
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF06161d),
                              Color(0xFF103b3a),
                            ]),
                      ),
                    ),
                  ),
                  /*Positioned(
                    right: 20,
                    top: 30,
                    child: Text(
                      "We Smurfing",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),*/
                ],
              ),

              //_buildTitle(),
              _subtitle(),
              _horizontalScroll(),
              _buildButtons(),
              _shoppingList(),
            ])),
      ),
    );
  }

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
        child: Text("iFridge",
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0)),
      );
  Widget _subtitle() => Padding(
        padding: EdgeInsets.only(top: 0, left: 10.0, right: 10.0),
        child: LeftRightAlign(
            left: Text("Expiring Soon...", style: TextStyle(fontSize: 25.0)),
            right: Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'all_items');
                },
                child: Text('See more',
                    style: TextStyle(fontSize: 15.0), textAlign: TextAlign.end),
              ),
            )),
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
              child: new RaisedButton.icon(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.blueGrey)),
                icon: Icon(Icons.add_shopping_cart),
                label: Text("Add Item"),
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
                child: new RaisedButton.icon(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.blueGrey)),
                  icon: Icon(Icons.assignment),
                  label: Text("Recipes"),
                  color: Colors.blueAccent[600],
                  onPressed: () => Navigator.pushNamed(context, 'input_screen'),
                ),
              ))
        ],
      ));
  Widget _shoppingList() => new Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: MaterialButton(
            height: 60.0,
            minWidth: MediaQuery.of(context).size.width,
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
      ]));
} // End of class

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 10);
    path.quadraticBezierTo(size.width / 4, size.height - 10,
        size.width / 2 - 35, size.height - 70);
    path.quadraticBezierTo(
        size.width / 4 * 3 - 35, -5, size.width, size.height - 90);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MyClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(30, 0);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
