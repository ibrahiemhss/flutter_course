import 'package:flutter/material.dart';
import 'package:listview3/app_screens/home.dart';

void main() {
  runApp(MaterialApp(
    title: "Exploring UI widgets",
    home: Scaffold(
      appBar: AppBar(
        title: Text("Basic List View"),
      ),
      body: getWidgetLongListItem(),
      floatingActionButton: FloatingActionButton(
          onPressed: (){

            debugPrint('added');

          },
      child: Icon(Icons.add),
      tooltip: 'Add one More Item',
      ),

    ),
  ));
}

////show snack Bar///
void showSnackBar(BuildContext context,String item){
  
  var snackBar=SnackBar(
    content: Text("you just tapped $item"),
    action: SnackBarAction(label: "UNDO",
        onPressed:(){

      debugPrint("performing dummy UNDO operating");

        }),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}

//----------------long list item ----------------------------------------------------

Widget getWidgetLongListItem(){

  var listItem=getLongListElements();
  var listView = ListView.builder(
    itemBuilder: (context,index){
      return ListTile(
        title: Text(listItem[index]),
        leading: Icon(Icons.arrow_right),
        onTap:(){
          //debugPrint("${listItem[index]} was tapped");

          showSnackBar(context,listItem[index]);
        },
      );
    }
  );
  return listView;
}
List<String> getLongListElements(){

  var items=List<String>.generate(1000, (counter)=>"item $counter");
  return items;
}


//--------------------------------------------------------------------
Widget getListView() {
  var listView = ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text("Beautiful View !"),
        trailing: Icon(Icons.wb_sunny),
        onTap: () {
          debugPrint("landscap tapped");
        },
      ),
      ListTile(
        leading: Icon(Icons.assistant_photo),
        title: Text("win !"),
      ),
      ListTile(
        leading: Icon(Icons.phone_android),
        title: Text("device !"),
      ),
      Text("another element in list"),
      Container(
        color: Colors.red,
        height: 50.0,
      )
    ],
  );
  return listView;
}
