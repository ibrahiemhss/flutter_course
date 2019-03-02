import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Simple Calculator App",
    home: SIForm(),
    theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepOrange,
        accentColor: Colors.deepOrangeAccent),
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var _currencies = ['Liver', 'Dinar', 'Pounds'];
  final _minimumPadding = 5.0;
  var _currentItemSelected = 'Liver';

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      //  resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Simple Calculator App"),
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
        //change Column to listView to make screen scrolling
        //  child: Column(
        child: ListView(
          children: <Widget>[
            getImageAsset(),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextField(
                keyboardType: TextInputType.number,
                style: textStyle,
                decoration: InputDecoration(
                    labelText: 'principal',
                    hintText: 'Enter princibal e.g 12000',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextField(
                keyboardType: TextInputType.number,
                style: textStyle,
                decoration: InputDecoration(
                    labelText: 'Rate of interest',
                    hintText: 'In percent',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      decoration: InputDecoration(
                          labelText: 'Term',
                          hintText: 'Time in year',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    )),
                    Container(
                      width: _minimumPadding * 5,
                    ),
                    Expanded(
                        child: DropdownButton<String>(
                      items: _currencies.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ))
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        textColor: Theme.of(context).primaryColorDark,
                        child: Text('Calculate', textScaleFactor: 1.5),
                        onPressed: () {}),
                  ),
                  Expanded(
                    child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Reset',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {}),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: Text(
                'Todo Text',
                style: textStyle,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/money.png');
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding * 10),
    );
  }
}
