
class Note{

  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  Note( this._title, this._date, this._priority );

  Note.withId(this._id, this._title, this._date, this._priority, this._description);

  int get priority => _priority;


  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get title => _title;

  set title(String value) {
    if(value.length<=255){
      this._title = value;

    }
  }
  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      this._priority = newPriority;
    }
  }


  int get id => _id;

//convert a Note object into a Map object

Map<String,dynamic> toMap(){
  var map=Map<String,dynamic>();
  if(id!=null){
    map['id']=_id;
  }
  map['title']=_title;
  map['description']=_description;
  map['priority']=_priority;
  map['date']=_date;
  return map;
}
//extract a Note object from a Map object
 Note.fromMapObject(Map<String,dynamic> map){

  this._id=map['id'];
  this._title=map['title'];
  this._description=map['description'];
  this._priority=map['priority'];
  this._date=map['date'];

 }

}