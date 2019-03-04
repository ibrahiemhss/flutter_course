import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:note_keeper_app_6/models/note.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; //$singleton DatabaseHelper
  static Database _database;

  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  DatabaseHelper._createInstance(); //Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    if (_databaseHelper != null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); //This is executed only once, sigltone object

    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDatabase();
    }
    return _database;
  }

  Future<Database> initDatabase() async {
    //Get the directory path for both Android and IOS store database

    Directory _directory = await getApplicationDocumentsDirectory();
    String path = _directory.path + 'notes.db';

    //Open/create the database at a given path
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _creatDb);

    return notesDatabase;
  }

  void _creatDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $noteTable'
        '( $colId INTEGER PRIMARY KEY AUTOINCREMENT,'
        '  $colTitle TEXT, '
        '  $colDescription TEXT, '
        '  $colPriority INTEGER, '
        '  $colDate TEXT');
  }

  //Fetch Operation: Get All note Objects from database

  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;
    // first way-----------------------
    //-->var result = await db.rawQuery('SELECT * $noteTable order by $colPriority ASC');
    // second way-----------------------
    var result = await db.query(noteTable, orderBy: '$colPriority ASC');
    return result;
  }

  //Insert Operation: Insert a note Object and save it to database
  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

  //Update Operation: update a note Object and save it to database

  Future<int> ubdateNote(Note note) async {
    Database db = await this.database;
    var result = await db.update(noteTable, note.toMap(),
        where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

  //Delete Operation: delete a note Object from database

  Future<int> deleteNote(int id) async {
    Database db = await this.database;
    var result = await db.rawDelete('DELETE FROM $noteTable WHERE $colId =$id');
    return result;
  }

  //Get Operation: Get a number of  note Objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $noteTable');
    var result = Sqflite.firstIntValue(x);
    return result;
  }
  //Get the 'Map List' [ List<Map> ] and convert it to Note List [ List<Note> ]

  Future<List<Note>> getNoteList() async{
    var noteMapList= await getNoteMapList();
    int count= noteMapList.length;

    List<Note> noteList= List<Note>();
    for (int i =0 ;i<count ;i++){
      noteList.add(Note.fromMapObject(noteMapList[i]));
    }

    return noteList;
  }
}
