import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Possible Band Names'),
    );
  }
}

class MockBandInfo {
  const MockBandInfo({this.name, this.votes});

  final String name;
  final int votes;
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  Widget _builderListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              //Firestore.instance.collection('bandanames').document('name').get(),
              document['name'],
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffddddff),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              document['votes'].toString(),
              style: Theme.of(context).textTheme.display1,
            ),
          )
        ],
      ),
      onTap: () {
        //First way
        /*document.reference.updateData({
          "votes":document['votes']+1
        });*/

        //Second way
        Firestore.instance.runTransaction((transaction) async{
          DocumentSnapshot freshSnap=
              await transaction.get(document.reference);
          await transaction.update(freshSnap.reference,{
            "votes":document['votes']+1,
          });
        });
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: StreamBuilder(
            stream:Firestore.instance.collection('bandanames').snapshots(),
            builder:(context,AsyncSnapshot<QuerySnapshot> snapshot)
            {
              if (snapshot.hasError) {
                print(snapshot.error.toString());
              }else if(!snapshot.hasData) {
                return const Text('Loaing...');

              }else {
                return ListView.builder(
                  itemExtent: 80.0,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) =>
                      _builderListItem(context, snapshot.data.documents[index]),
                );
              }
            }
          ),

            ///way 2
           /* child: StreamBuilder(
                stream:Firestore.instance.collection('bandanames').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
                  if (snapshot.hasError)
                    return new Text(
                        'Error: ${snapshot.error}');
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return new Text('Loading...');
                    default:
                      return new ListView(
                        children: snapshot.data.documents.map((
                            DocumentSnapshot document) {
                          return new ListTile(
                            title: new Text(document['name']),
                            subtitle: new Text(document['votes'].toString()),
                          );
                        }).toList(),
                      );
                  }
                }

            )*/
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
