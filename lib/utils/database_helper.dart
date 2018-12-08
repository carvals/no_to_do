import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';



class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
    final String tableNoTask = "notasktable";
    final String columnId = "id";
    final String columnName = "taskname";
    final String columnDueDate = "duedate";
  
    //return the existing instance
    factory DatabaseHelper() => _instance;
  
    static Database _db;
  
    //see the use of that...
    DatabaseHelper.internal();

  //getter to check everytime you call db
  Future<Database> get db async{
    if(_db != null){
      return _db;
    }
    else
    {
      _db = await initDB();
            return _db;
          }
        }
    
    //init the database
        initDB() async {
            Directory documentDirectory = await getApplicationDocumentsDirectory();
            String path = join(documentDirectory.path,"notododb");

            //version of the database important for upgrade
            var ourDb = await openDatabase(
              path, 
              version:1,
              onCreate: _onCreate);
            
            return ourDb;
                      }
                      
              
        void _onCreate(Database db, int newVersion) async {
          await db.execute(
            "CREATE TABLE $tableNoTask($columnId INTERGER PRIMARY KEY,"
            "$columnName TEXT, $columnDueDate TEXT)"
          );
  }
}