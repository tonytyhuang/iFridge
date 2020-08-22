import 'package:flutter/material.dart';

class AllItems extends StatefulWidget {
  @override
  _AllItemsState createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height, 
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 2, 
                      children: List.generate(50, (index){
                        return Container(
                          child: Card(
                            color:Colors.grey
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
