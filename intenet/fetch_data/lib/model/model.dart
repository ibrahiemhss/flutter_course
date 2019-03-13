import "package:flutter/material.dart";
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show get;

class MyData {
  String id;
  String name, imageUrl;

  dynamic ctg = new List<String>();

  MyData({
    this.id,
    this.name,
    this.imageUrl});


  MyData.fromMap(Map<String, dynamic> data) {
    this.ctg = data['categories'];

  }
  Map<String, dynamic> TojsonData() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["en_name"] = name;
    map["image"] = imageUrl;

    return map;
  }
  factory MyData.fromJson(Map<String, dynamic> jsonData){
    return MyData(
      id: jsonData['id'],
      name: jsonData['en_name'],
      imageUrl: jsonData['image'],
    );
  }
}



