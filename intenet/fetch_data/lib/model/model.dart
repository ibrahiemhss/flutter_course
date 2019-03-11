import "package:flutter/material.dart";
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show get;

class MyData{

   String id;
   String name,imageUrl;
  MyData({
    this.id,
    this.name,
    this.imageUrl});

  factory MyData.fromJson(Map<String,dynamic> jsonData){
    return MyData(
      id: jsonData['id'],
      name: jsonData['name'],
      imageUrl: jsonData['imageUrl'],
    );
  }
}