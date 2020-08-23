import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/food.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.only(
                right: 30.0, left: 30.0, top: 100.0, bottom: 100.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 220,
                  child: Image(
                    width: 200,
                    image: AssetImage("assets/images/fridge.png"),
                  ),
                ),
                Positioned(
                  bottom: 150,
                  child: Text(
                    "iFRIDGE",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: RaisedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, 'loginScreen'),
                    textColor: Colors.white,
                    padding: EdgeInsets.all(0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF039BE5),
                            Color(0xFF29B6F6),
                            Color(0xFF81D4FA),
                          ],
                        ),
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Get Started",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
