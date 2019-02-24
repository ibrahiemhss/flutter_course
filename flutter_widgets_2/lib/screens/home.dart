import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Container(
            alignment: Alignment.center,
            color: Colors.deepPurple,
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 50.0),

            ////-----margin , padding and box constraints-----------
            /*width: 200.0,
        height: 100.0,
        margin: EdgeInsets.all(50.0),
        padding: EdgeInsets.all(50.0),*/

            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Flight To ",
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
                    Expanded(
                        child: Text(
                      "Sinai  ",
                      textDirection: TextDirection.ltr,

                      ///----adding custom properties for text----------
                      style: TextStyle(
                          //line under text
                          decoration: TextDecoration.none,
                          fontSize: 10.0,
                          fontFamily: 'Muli',
                          color: Colors.white),
                    )),
                    Expanded(
                        child: Text(
                      "ate  24/2/2019",
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
                    Expanded(
                        child: Text(
                      "column2 row1 ",
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
                    Expanded(
                        child: Text(
                      "column2 row2 ",
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
                    Expanded(
                        child: Text(
                      "column2 row3 ",
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
                FlightImageAsset(),
                FlightBookButton()
              ],
            )));
  }
}

class FlightImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage("images/flight.png");
    Image image = Image(
      image: assetImage,
      width: 250.0,
      height: 250.0,
    );

    return Container(
      child: image,
    );
  }
}

class FlightBookButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 40.0),
      width: 250.0,
      height: 50.0,
      child: RaisedButton(
          color: Colors.orange,
          child: Text(
            "book your flight",
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontFamily: "Muli",
                fontWeight: FontWeight.w700),
          ),
          elevation: 6.0,
          onPressed: () => bookFlight(context)),
    );
  }

  void bookFlight(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Flight Booked successfully"),
      content: Text("Have a pleasant flight"),
    );
    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }
}
