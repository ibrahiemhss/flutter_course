import 'package:flutter/material.dart';
import 'package:note_keeper_app_6/models/note.dart';
import 'package:note_keeper_app_6/utils/database_helper.dart';
import 'package:intl/intl.dart';

class NoteDetails extends StatefulWidget {
  final String appBarTitle;
  final Note note;

  NoteDetails(this.note,this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailsState(this.note,this.appBarTitle);
  }
}

class NoteDetailsState extends State<NoteDetails> {
  static var _priorities = ['high', 'low'];
  String appBarTitle;
  Note note;
  DatabaseHelper helper = DatabaseHelper();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  NoteDetailsState(this.note,this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    titleController.text=note.title;
    descriptionController.text=note.description;
    return WillPopScope(
        onWillPop: () {
          //todo cotrol things when user press Back
          moveToLastScreen();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(appBarTitle),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  //todo cotrol things when user press Back

                  moveToLastScreen();
                }),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[
                /*----------------- First Element --------------*/
                ListTile(
                  title: DropdownButton(
                      items: _priorities.map((String drpDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: drpDownStringItem,
                          child: Text(drpDownStringItem),
                        );
                      }).toList(),
                      style: textStyle,
                      value: getPriorityAsString(note.priority),
                      onChanged: (valueSelectedByUser) {
                        setState(() {
                          debugPrint('User selected $valueSelectedByUser');
                          updatePriorityAsInt(valueSelectedByUser);
                        });
                      }),
                ),

                /*----------------- Second Element --------------*/
                Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: TextField(
                      controller: titleController,
                      style: textStyle,
                      onChanged: (value) {
                        debugPrint('change in title text field is ===> $value');
                        updateTitle();
                      },
                      decoration: InputDecoration(
                          labelText: 'Title',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),

                /*----------------- Third Element --------------*/
                Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: TextField(
                      controller: titleController,
                      style: textStyle,
                      onChanged: (value) {
                        debugPrint(
                            'change in Description text field is ===> $value');
                        updateDecsription();
                      },
                      decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),

                /*----------------- Fourth Element --------------*/
                Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                              color: Theme.of(context).primaryColorDark,
                              textColor: Theme.of(context).primaryColorLight,
                              child: Text(
                                'Save',
                                textScaleFactor: 1.5,
                              ),
                              onPressed: () {
                                setState(() {
                                  debugPrint('Save button clicked');
                                  _save();
                                });
                              }),
                        ),
                        Container(
                          width: 5.0,
                        ),
                        Expanded(
                          child: RaisedButton(
                              color: Theme.of(context).primaryColorDark,
                              textColor: Theme.of(context).primaryColorLight,
                              child: Text(
                                'Delete',
                                textScaleFactor: 1.5,
                              ),
                              onPressed: () {
                                setState(() {
                                  debugPrint('Delete button clicked');
                                  _delete();
                                });
                              }),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ));
  }

  void moveToLastScreen() {
    Navigator.pop(context,true);
  }

  //Convert the String priority in the form of integer before saving it to Database
void updatePriorityAsInt(String value){
    switch (value){
      case 'High':
        note.priority=1;
        break;
      case 'Low':
        note.priority=2;
        break;
    }
}

//Convert the int priority to String and display it to user in DropDown
  String getPriorityAsString(int value){
    String priority;
    switch (value){
      case 1:
        priority=_priorities[0];
        break;
      case 2:
        priority=_priorities[1];
        break;
    }
    return priority;
  }

  //Update the title of Note object
void updateTitle(){
    note.title=titleController.text;
}

//Update the description of Note object
  void updateDecsription(){
    note.description=descriptionController.text;
  }

  //Save data to database

void _save() async {

    moveToLastScreen();
    var now = new DateTime.now();

    note.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if(note.id !=null){//caes 1 update operation

      result=await helper.ubdateNote(note);
    }else{//case 2 insert operation
      result=await helper.insertNote(note);

    }
    if(result !=0){//success

      _showAlertDialog('Status','Note Saved Successfully');
    }else{//failed
      _showAlertDialog('Status','Proplem Saving Note');

    }
}

  void _delete() async {



    moveToLastScreen();

    //Case 1: if user trying to delete the New Note i.e he has come to
    //the detail page by pressing the FAB of notelist page

    if(note.id !=null){//caes 1 update operation

      _showAlertDialog('Status', 'No Note was deleted');
     return;
    }
    //Case 2: user is trying to delete the old note that already has a valid ID

    int result = await helper.deleteNote(note.id);

    if(result !=0){//success

      _showAlertDialog('Status','Note Delted Successfully');
    }else{//failed
      _showAlertDialog('Status','Error Occured While Deleting Note');

    }
  }


  void _showAlertDialog(String title, String message) {

    AlertDialog alertDialog=AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
        context:context,
      builder: (_)=>alertDialog
    );
  }
}
