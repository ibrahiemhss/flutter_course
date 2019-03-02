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
  var _currentItemSelected ='';
  @override
  initState(){
    _currentItemSelected = _currencies[0];

  }

  TextEditingController principalController = TextEditingController();
  TextEditingController roinController = TextEditingController();
  TextEditingController termController = TextEditingController();

  var _displayResult='';

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
                controller: principalController,
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
                controller: roinController,
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
                          controller: termController,
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
                      value: _currentItemSelected,
                      onChanged: (String newValueSelcted) {
                        _onDropDownItemSelcted(newValueSelcted);
                      },
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
                        onPressed: () {
                          setState(() {
                            this._displayResult=_calculateTotalReturns();
                          });
                        }),
                  ),
                  Expanded(
                    child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Reset',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            _reset();
                          });
                        }),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: Text(
                this._displayResult,
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

  void _onDropDownItemSelcted(String newValueSelcted) {
    setState(() {
      this._currentItemSelected = newValueSelcted;
    });
  }

  String _calculateTotalReturns() {

    double principal=double.parse(principalController.text);
    double rio=double.parse(roinController.text);
    double term=double.parse(termController.text);

    double totalAmountPayable=principal+(principal*rio*term)/100;
    String result ='After $term year , your investment will be worth $totalAmountPayable $_currentItemSelected';
    return result;
  }

  void _reset() {
    principalController.text='';
    roinController.text='';
    termController.text='';
    _displayResult='';
    _currentItemSelected=_currencies[0];
  }
}
