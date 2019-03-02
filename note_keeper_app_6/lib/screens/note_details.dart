import 'package:flutter/material.dart';


class NoteDetails extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NoteDetailsState();
  }

}

class NoteDetailsState extends State<NoteDetails>{

  static var _priorities =['high' , 'low'];
  TextEditingController titleController =TextEditingController();
  TextEditingController descriptionController =TextEditingController();

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle=Theme.of(context).textTheme.title;
    return Scaffold(

      appBar: AppBar(
        title: Text("Edit Notes"),
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 15.0,left: 10.0,right: 10.0 ),
        child: ListView(
          children: <Widget>[

            /*----------------- First Element --------------*/
            ListTile(
              title: DropdownButton(
                  items: _priorities.map((String drpDownStringItem){
                    return DropdownMenuItem<String> (
                      value: drpDownStringItem,
                      child: Text(drpDownStringItem),
                    );

                  }).toList(),
                  style: textStyle,
                  value: 'low',
                  onChanged: (valueSelectedByUser){

                    setState(() {
                      debugPrint('User selected $valueSelectedByUser');
                    });

                  }),
            ),

            /*----------------- Second Element --------------*/
             Padding(
                 padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
            child: TextField(
              controller: titleController,
              style: textStyle,
              onChanged: (value){
                debugPrint('change in title text field is ===> $value');

              },
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
            )),


            /*----------------- Third Element --------------*/
            Padding(
                padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
                child: TextField(
                  controller: titleController,
                  style: textStyle,
                  onChanged: (value){
                    debugPrint('change in Description text field is ===> $value');

                  },
                  decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                )),


            /*----------------- Fourth Element --------------*/
            Padding(
                padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
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
                          onPressed: (){

                            setState(() {
                              debugPrint('Save button clicked');

                            });
                          }),
                    ),
                    Container(width: 5.0,),
                    Expanded(
                      child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Delete',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: (){

                            setState(() {
                              debugPrint('Delete button clicked');

                            });
                          }),
                    )
                  ],
                ))
          ],
        ),
      ),

    );
  }


}
