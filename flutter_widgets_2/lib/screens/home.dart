import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(

          alignment: Alignment.center,
          color: Colors.deepPurple,
      ////-----margin , padding and box constraints-----------
        /*width: 200.0,
        height: 100.0,
        margin: EdgeInsets.all(50.0),
        margin: EdgeInsets.only(left:50.0,right: 50.0,top: 10.0),
        padding: EdgeInsets.all(50.0),*/

        child: Text("Flight",
            textDirection: TextDirection.ltr,
          ///----adding custom properties for text----------
          style: TextStyle(
            //line under text
            decoration: TextDecoration.none,
              fontSize: 100.0,
              fontFamily: 'Muli',
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              color: Colors.white
          ),
        ),
      )
    );
  }

}