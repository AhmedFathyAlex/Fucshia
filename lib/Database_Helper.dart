import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:fuchsia_app/User.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper
  static Database _database; // Singleton Database
  String tableName = 'User_data_table';
  String colId = 'id';
  String colUserName = 'fullName';
  String colFirstName = 'firstName';
  String colLastName = 'lastName';
  String colImage = 'imagePath';
  String colGender = 'gender';
  String colToken = 'token';
  String colPriority = 'priority';
  String colEmail = 'email';
  String colPrimaryKey = 'PrimaryKey';
  String databaseName = "fuchsia.db";

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + databaseName;

    // Open/create the database at a given path
    var fuchsiaDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return fuchsiaDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableName( $colPrimaryKey INTEGER AUTOINCREMENT PRIMARY KEY,$colToken TEXT,$colId INTEGER, $colUserName TEXT, '
        '$colFirstName TEXT, $colLastName TEXT, $colImage TEXT, $colGender TEXT,$colEmail TEXT, $colPriority INTEGER)');
  }

  // Fetch Operation: Get all Users objects from database
  Future<List<Map<String, dynamic>>> getUsersMapList() async {
    Database db = await this.database;

    var result = await db.rawQuery('SELECT * FROM $tableName');
    // var result = await db.query(noteTable, orderBy: '$colPriority ASC');
    return result;
  }

  // Insert Operation: Insert a User object to database
  Future<int> insertUser(User person) async {
    Database db = await this.database;
    var result = await db.insert(tableName, person.toMap());
    return result;
  }

  // Delete Operation: Delete a Note object from database
  Future<int> deleteUser(String token) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $tableName WHERE $colToken = $token');
    return result;
  }

  Future<List<User>> getUserList() async {
    var userMapList = await getUsersMapList(); // Get 'Map List' from database
    int count =
        userMapList.length; // Count the number of map entries in db table

    List<User> usersList = List<User>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      usersList.add(User.fromMapObject(userMapList[i]));
    }

    return usersList;
  }
  deleteDatabase(){
    _database=null;
  }
}
