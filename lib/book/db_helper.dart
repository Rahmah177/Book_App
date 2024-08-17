import 'package:book_app/book/book_model.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DbHelper {
  Database? database;
  String tableNAme = 'books';
  Future onCreateDatabase(Database database, int version) async {
    await database.execute(
      'CREATE TABLE books ( id INTEGER PRIMARY KEY, title Text, auther Text, cover Text)',
    );
  }

  Future<Database?> initdatabase() async {
    if (database != null) {
      return database;
    }
    String path = join(await getDatabasesPath(), 'books.db');
    database = await openDatabase(
      path,
      version: 1,
      onCreate: onCreateDatabase,
    );
    return database;
  }

  Future getDataFormDatabase() async {
    Database? database = await initdatabase();
    return await database!.query(tableNAme);
  }

  Future insertIntoDatabase(BookModel bookModel) async {
    Database? database = await initdatabase();
    await database!.insert(
      tableNAme,
      bookModel.tomap(),
    );
  }

  Future deleteFromDatabase(int id) async {
    Database? database = await initdatabase();
    await database!.delete(tableNAme, where: 'id = ?', whereArgs: [id]);
  }
}
