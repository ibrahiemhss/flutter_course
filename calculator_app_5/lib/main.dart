import 'package:flutter/material.dart';

void main() {

  runApp(
      MaterialApp(
        title: "Simple Calculator App",
        home: SIForm (),
      )
  );
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
  final _minimumPadding=5.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Calculator App"),
      ),
      body: Container(
          margin:EdgeInsets.all(_minimumPadding * 10),
        child: Column(
          children: <Widget>[
            getImageAsset(),

            Padding(
              padding: EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding),
              child:
            TextField(
              decoration: InputDecoration(
                labelText: 'principal',
                hintText: 'Enter princibal e.g 12000',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )
              ) ,
            ),),
        Padding(
          padding: EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding),
          child:
        TextField(
              decoration: InputDecoration(
                  labelText: 'Rate of interest',
                  hintText: 'In percent',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  )
              ) ,
        ),),

            Row(
              children: <Widget>[
                Expanded (
                    child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Term',
                      hintText: 'Time in year',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      )
                  ) ,
                )),

                Expanded (child: DropdownButton<String>(

                  items: _currencies.map((String value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );

                  }).toList(),
                 // value :'Livers',
                  onChanged: (String newValueSelcted){

                  },
                ))


              ],
            )
          ],
        ),
      ),
    );
  }
  Widget getImageAsset(){
    AssetImage assetImage=AssetImage('images/money.png');
    Image image=Image(image: assetImage,width: 125.0,height: 125.0,);
    return Container(
      child:
      image,);
  }
}