import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UploadScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UploadScreenState();
}

class UploadScreenState extends State<UploadScreen> {
  var items = <ItemInfo>{
    ItemInfo(itemName: "Tomato", itemQuantity: "5"),
    ItemInfo(itemName: "Cucumber", itemQuantity: "3")
  };
  bool initial = true;

  var selectedItems = <ItemInfo>{};

  onSelectedRow(bool selected, ItemInfo item) async {
    setState(() {
      if (selected) {
        if (selected) {
          selectedItems.add(item);
        } else {
          items.remove(item);
        }
      }
    });
  }

  deleteSelected() async {
    setState(() {
      if (items.isNotEmpty) {
        List<ItemInfo> temp = [];
        temp.addAll(selectedItems);
        for (ItemInfo item in temp) {
          items.remove(item);
          selectedItems.remove(item);
        }
      }
    });
  }

  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          DataTable(
            sortColumnIndex: 0,
            columns: [
              DataColumn(
                label: Text("Item"),
                numeric: false,
                tooltip: "Enter your grocery item here.",
              ),
              DataColumn(
                label: Text("Quantity"),
                numeric: true,
                tooltip: "Enter the quantity of the item here.",
              ),
            ],
            rows: items
                .map(
                  (user) => DataRow(
                      selected: selectedItems.contains(user),
                      onSelectChanged: (b) {
                        print("Onselect");
                        onSelectedRow(b, user);
                      },
                      cells: [
                        DataCell(
                          //Text(user.firstName),
                          TextField(
                            onChanged: (text) {
                              user.itemName = text;
                            },
                          ),
                        ),
                        DataCell(
                          TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (text) {
                              user.itemQuantity = text;
                            },
                          ),
                        ),
                      ]),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Future<void> addFood(String name, String quantity, String expiration) async {
    final uid = await FirebaseAuth.instance.currentUser();
    final CollectionReference foodDatabase = Firestore.instance
        .collection('Users')
        .document(uid.uid)
        .collection('Food');
    return foodDatabase
        .add({
          'name': name, // John Doe
          'quantity': quantity, // Stokes and Sons
          'expiration': expiration, // 42
        })
        .then((value) => print("Food Added"))
        .catchError((error) => print("Failed to add food: $error"));
  }

  itemsUpload() {
    //TONY PUT DOWNLOAD HERE, LIST IS CALLED "ITEMS"
    items.forEach((element) {
      addFood(element.itemName, element.itemQuantity, '23/08/20');
    });

    Navigator.pushNamed(context, 'home_screen');
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit and Save'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.file_download, color: Colors.white),
              iconSize: 30,
              padding: EdgeInsets.only(right: 20),
              onPressed: () => itemsUpload(),
            )
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Expanded(
              child: dataBody(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: OutlineButton(
                    child: Text('Add Item'),
                    onPressed: () {
                      var item = new ItemInfo();
                      item.itemName = "Item";
                      item.itemQuantity = "Quantity";
                      items.add(item);
                      setState(() {});
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: OutlineButton(
                    child: Text('Delete Selected'),
                    onPressed: selectedItems.isEmpty
                        ? null
                        : () {
                            deleteSelected();
                          },
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class ItemInfo {
  String itemName, itemQuantity;

  /* Implementing expiry date switcher

  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: selectedDate,
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  */
  ItemInfo({this.itemName, this.itemQuantity});
}
