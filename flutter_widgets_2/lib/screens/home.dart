import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(

          alignment: Alignment.center,
          color: Colors.deepPurple,
          padding: EdgeInsets.only(left:10.0,right: 10.0,top: 50.0),

          ////-----margin , padding and box constraints-----------
        /*width: 200.0,
        height: 100.0,
        margin: EdgeInsets.all(50.0),
        padding: EdgeInsets.all(50.0),*/

        child:Column(
          children: <Widget>[

         Row(
        children: <Widget>[

          Expanded(child: Text("my name is  ",
          textDirection: TextDirection.ltr,

          ///----adding custom properties for text----------
          style: TextStyle(
            //line under text
              decoration: TextDecoration.none,
              fontSize: 20.0,
              fontFamily: 'Muli',
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              color: Colors.white),
        )),
          Expanded(child: Text("ibrahim  ",
        textDirection: TextDirection.ltr,

        ///----adding custom properties for text----------
        style: TextStyle(
          //line under text
            decoration: TextDecoration.none,
            fontSize: 10.0,
            fontFamily: 'Muli',
            color: Colors.white),
      )),
          Expanded(child: Text("age  22 y ",
        textDirection: TextDirection.ltr,

        ///----adding custom properties for text----------
        style: TextStyle(
          //line under text
            decoration: TextDecoration.none,
            fontSize: 10.0,
            fontFamily: 'Muli',
            color: Colors.white),
      ))
      ],
    ),


         Row(
           children: <Widget>[

             Expanded(child: Text("column2 row1 ",
               textDirection: TextDirection.ltr,

               ///----adding custom properties for text----------
               style: TextStyle(
                 //line under text
                   decoration: TextDecoration.none,
                   fontSize: 10.0,
                   fontFamily: 'Muli',
                   fontWeight: FontWeight.w700,
                   fontStyle: FontStyle.italic,
                   color: Colors.white),
             )),
             Expanded(child: Text("column2 row2 ",
               textDirection: TextDirection.ltr,

               ///----adding custom properties for text----------
               style: TextStyle(
                 //line under text
                   decoration: TextDecoration.none,
                   fontSize: 10.0,
                   fontFamily: 'Muli',
                   fontWeight: FontWeight.w700,
                   fontStyle: FontStyle.italic,
                   color: Colors.white),
             )),
             Expanded(child: Text("column2 row3 ",
               textDirection: TextDirection.ltr,

               ///----adding custom properties for text----------
               style: TextStyle(
                 //line under text
                   decoration: TextDecoration.none,
                   fontSize: 10.0,
                   fontFamily: 'Muli',
                   fontWeight: FontWeight.w700,
                   fontStyle: FontStyle.italic,
                   color: Colors.white),
             ))
           ],
         ),

         Row(
           children: <Widget>[

             Expanded(child: Text("column3 row1 ",
               textDirection: TextDirection.ltr,

               ///----adding custom properties for text----------
               style: TextStyle(
                 //line under text
                   decoration: TextDecoration.none,
                   fontSize: 10.0,
                   fontFamily: 'Muli',
                   fontWeight: FontWeight.w700,
                   fontStyle: FontStyle.italic,
                   color: Colors.white),
             )),
             Expanded(child: Text("column3 row2 ",
               textDirection: TextDirection.ltr,

               ///----adding custom properties for text----------
               style: TextStyle(
                 //line under text
                   decoration: TextDecoration.none,
                   fontSize: 10.0,
                   fontFamily: 'Muli',
                   fontWeight: FontWeight.w700,
                   fontStyle: FontStyle.italic,
                   color: Colors.white),
             )),
             Expanded(child: Text("column3 row3 ",
               textDirection: TextDirection.ltr,

               ///----adding custom properties for text----------
               style: TextStyle(
                 //line under text
                   decoration: TextDecoration.none,
                   fontSize: 10.0,
                   fontFamily: 'Muli',
                   fontWeight: FontWeight.w700,
                   fontStyle: FontStyle.italic,
                   color: Colors.white),
             ))
           ],
         ),

            FlightImageAsset()
          ],
        )

      )
    );
  }

}
class FlightImageAsset extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage=AssetImage("images/offers.png");
    Image image=Image(image: assetImage,width: 250.0,height: 250.0,);

    return Container(child: image,);
  }

}