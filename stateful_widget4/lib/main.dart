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
            Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "your best city is $nameCity",
                  style: TextStyle(fontSize: 23.0),
                ))
          ],
        ),
      ),
    );
  }
}
