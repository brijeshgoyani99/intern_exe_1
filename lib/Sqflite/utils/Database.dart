import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:internprac1/Sqflite/models/user.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), 'demo.db'),
        onCreate: (db, version) async {
      await db.execute('''
          CREATE TABLE users(
            username TEXT PRIMARY KEY , password TEXT
          )
          ''');
    }, version: 1);
  }

  newUser(User newUser) async {
    final db = await database;

    var res = await db.rawInsert('''
    INSERT INTO users(
      username, password
    ) VALUES (?,?)
    ''', [newUser.username, newUser.password]);

    return res;
  }

  Future<dynamic> getUser() async{
    final db=await database;
    var res=await db.query("users");
    if(res.length==0){
      return null;
    }else{
      var resMap = res[0];
      print("res[0]:  "+ res[0].toString());
      return resMap.isNotEmpty ? resMap:null;
    }
  }
}
