import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Statefull App Example",
    home: FavoriteCity(),
  ));
}

class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _favoriteCityState();
  }
}

class _favoriteCityState extends State<FavoriteCity> {
  String nameCity = "";
  var _currencies = ['Liver', 'Dollar', 'Pounds', 'Dinar'];

  var _currentItemSelected;

  @override
  Widget build(BuildContext context) {
    debugPrint("favorite city widget created");
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Statefull App Example"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (String userInput) {
                setState(() {
                  debugPrint(
                      "set state is called , this tells to redraw the favCity widget");

                  nameCity = userInput;
                });
              },
            ),
            DropdownButton<String>(
              items: _currencies.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (String newValueSelected) {
                //your code to execute, when a menu item is selscted from drop down

                _onDropDownItemSelcted(newValueSelected);
              },
              value: _currentItemSelected,
            ),
            Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "your best city is $nameCity currency is $_currentItemSelected",
                  style: TextStyle(fontSize: 23.0),
                ))
          ],
        ),
      ),
    );
  }

  void _onDropDownItemSelcted(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}
