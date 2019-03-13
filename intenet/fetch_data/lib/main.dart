import 'dart:io';

import 'package:http/http.dart';

import 'package:fetch_data/model/model.dart';
import "package:flutter/material.dart";
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show post;
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
      title: "Hospital Management",
      home: MyHomePage(),
    ));


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = 'http://enjezni.com/fetch_data/getAllCtg.php';
  List data;

  Future<String> makeRequest() async {

    var queryParameters = {
      'lang': 'en',
    };
    var response = await http
        .post(
        Uri.encodeFull(url),
        body:queryParameters,
        headers: {"Accept": "application/json"});

    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata["categories"];
    });
  }

  @override
  void initState() {
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child:

          new ListView.builder(
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, i) {
                return new Card(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(data[i]["en_name"]),
                         CircleAvatar(
                                  backgroundImage:
                                  new NetworkImage(data[i]["image"]))
                        ]));
              }, scrollDirection: Axis.horizontal

          ),
/*
          child: new ListView.builder(itemBuilder: (context, index){
            return createViewItem(data,context,index);
             }, scrollDirection: Axis.horizontal,),*/
        ));
  }

}

