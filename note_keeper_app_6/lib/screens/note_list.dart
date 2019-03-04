
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:note_keeper_app_6/screens/note_details.dart';
import 'package:note_keeper_app_6/models/note.dart';
import 'package:note_keeper_app_6/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class NoteList extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count= 0;
  @override
  Widget build(BuildContext context) {
    if(noteList==null){
      noteList=List<Note>();
      updateList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          navigateToDetails('add note');
        },
        tooltip: 'Add Note',
        child: Icon(Icons.add),
        //  backgroundColor: Colors.deepPurple,
      ),
    );
  }

  ListView getNoteListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: getPriorityColor(this.noteList[position].priority),
                child: getPriorityIcon(this.noteList[position].priority),
              ),
              title: Text(
                this.noteList[position].title,
                style: titleStyle,
              ),
              subtitle: Text(this.noteList[position].date),
              trailing: GestureDetector(
                child: Icon(
                  Icons.delete,
                  color: Colors.grey,
                ),
                onTap: (){
                  _delete(context, noteList[position]);
                },
              ),

              onTap: () {
                debugPrint('listTile Tapped');
                navigateToDetails('edit note');
              },
            ),
          );
        });
  }

  Color getPriorityColor(int priority){

    switch(priority){
      case 1:
          return Colors.red;
          break;
      case 2:
        return Colors.yellow;
        break;
      default:
        return Colors.yellow;
    }
  }


  Icon getPriorityIcon(int priority){

    switch(priority){
      case 1:
        return Icon(Icons.play_arrow);
        break;
      case 2:
        return Icon(Icons.keyboard_arrow_right);
        break;
      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  void _delete(BuildContext context,Note note) async{
    int result = await databaseHelper.deleteNote(note.id);

    if(result !=0){
      _showSnakeBar(context,'Note Deleted Successfully');
      updateList();
      //TODO AT 7 : 38
    }
  }
  void navigateToDetails(String title) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetails(title);
    }));
  }


  void updateList() {

    final Future<Database> dbFuture=databaseHelper.initDatabase();

    dbFuture.then((database){
      Future<List<Note>> noteListFuture=databaseHelper.getNoteList();
      noteListFuture.then((noteList){
      setState(() {
        this.noteList=noteList;
        this.count=noteList.length;

      });
      });
    });
  }
}



void _showSnakeBar(BuildContext context, String s) {

  final snackBar=SnackBar(content: Text(s),);
  Scaffold.of(context).showSnackBar(snackBar);
}
