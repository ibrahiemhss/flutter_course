import 'package:flutter/material.dart';
import 'dart:math';



class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Material(
      color:Colors.green ,
      child: Center(
        child:Text(
          "my rand num is ${generateNum()}",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              color: Colors.white,fontSize: 40.0
          ),
        ),
      ),
    );
  }


  int  generateNum(){

    var randNum=Random();

    return randNum.nextInt(10);
  }

}