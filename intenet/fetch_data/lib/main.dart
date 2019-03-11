import 'package:fetch_data/model/model.dart';
import "package:flutter/material.dart";
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show get;
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
      title: "Hospital Management",
      home: MyApp(),
    ));

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}
class ListOfData extends StatelessWidget {
  final List<MyData> listData;

  const ListOfData(this.listData);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, index) {
          return createViewItem(listData[index], context);
        });
  }

  Widget createViewItem(MyData data, BuildContext context) {
    return new ListTile(
      title: new Card(
        elevation: 4.0,
        child: new Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.yellow)),
          padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.all(2.0),
          child: Column(
            children: <Widget>[
              Padding(
                child: Image.network(data.imageUrl),
                padding: EdgeInsets.only(bottom: 8.0),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    child: Text(
                      data.name,
                      style: new TextStyle(fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    padding: EdgeInsets.all(1.0),),

                ],
              )
            ],
          ),
        ),
      ),
      onTap: (){

       // var route= new MaterialPageRoute(
         //   builder:(BuildContext context)=>
               // new ScreenDetails(value:listData),
      //  );

       // Navigator.of(context).push(route);

      });
  }


}
Future<List<MyData>> downloadJSON() async{

  final jsonUrl="http://enjezni.com/fetch_data/getAllCtg.php";



  final response= await get(jsonUrl,headers: {"lang": "Application/json"});

  if(response.statusCode == 200){
    List myListData=json.decode(response.body);

    return myListData
        .map((listData)=>
    new MyData.fromJson(listData))
    .toList();
  }else{
    throw Exception("error we were not able to successfully download the json data");
  }

}

