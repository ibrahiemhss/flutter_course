
import 'package:flutter/material.dart';
import 'package:flutter_app/app_screens/first_screen.dart';

void main()=> runApp(new MyFlutterApp());



class MyFlutterApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
        title: "materail app",
        home: Scaffold(
          appBar: AppBar(title: Text("flutter demo"),),
          body:FirstScreen(),
        )
      );
  }


}

