// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class DBHandler {
//   Database? _database;
//
//   Future<Database?> get database async {
//     if (_database != null) {
//       return _database;
//     }
//
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = join(directory.path, 'mydatabase.db');
//
//     _database = await openDatabase(path, version: 1, onCreate: (db, version) async {
//       await db.execute(
//           '''
//         CREATE TABLE DatabaseTable(
//         id INTEGER PRIMARY KEY,
//         name TEXT,
//         age INTEGER
//         )
//         '''
//       );
//     });
//     return _database;
//   }
//
//   Future<void> insertData() async {
//     Database? db = await database;
//     await db!.insert('DatabaseTable', {
//       'id': 3,
//       'name': 'Sakib',
//       'age': 18
//     });
//   }
//
// readData() async {
//     Database? db = await database;
//
//     final list = await db!.query('DatabaseTable');
//     return list;
//   }
// }


import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHandlear{
  static Database? _database;

 Future<Database?>get database async{
   if(_database != null){
     return _database;
   }
   Directory directory = await getApplicationDocumentsDirectory();
   String path = join(directory.path, "database.db");
  _database =  await openDatabase(path, version: 1,onCreate: (db, version) async{
    await db.execute(
'''
CREATE TABLE mydatabase(
id INTEGER PRIMARY KEY AUTOINCREMENT,
username TEXT,
email TEXT
)
'''
    );
  });
  return _database;
 }
  Future<void> insertData() async {
    Database? db = await database;
    await db!.insert('mydatabase', {
      'username': "Sakib",
      'email': 'Sakib@gmail.com',
    });
  }
  Future<List<Map<String, dynamic>>>ReadData() async{
   Database? db = await database;
   final list = await db!.query('mydatabase');
   return list;
 }
}