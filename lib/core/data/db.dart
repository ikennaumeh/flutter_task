import 'package:flutter/foundation.dart';
import 'package:flutter_task/core/app/app.locator.dart';
import 'package:flutter_task/core/data/article_store.dart';
import 'package:sqflite/sqflite.dart';

String dbName = "app_db";

class AppDB {
  late String databasePath;
  late Database _db;
  late ArticleStore articleStore;


  AppDB() {
    articleStore = locator.get<ArticleStore>();
  }

  Future<void> init() async {
    databasePath = await getDatabasesPath();
    _db = await openDatabase(
      "$databasePath/$dbName",
      version: 1,
      onCreate: onCreate,
    );

    articleStore.init(_db);
  }


  @visibleForTesting
  void onCreate(Database db, int version) async {
    await db.execute(ArticleStore.createUserStatement);
  }

  Future<void> clear() async {
    await articleStore.clear();
  }
}