import 'package:flutter/foundation.dart';
import 'package:flutter_task/core/models/top_stories.dart';
import 'package:sqflite/sqflite.dart';

class ArticleStore extends ChangeNotifier {
  late Database _db;
  static String tableName = "Article";

  void init(Database db){
    _db = db;
  }

  static String get createUserStatement => """
    CREATE TABLE IF NOT EXISTS $tableName (
    id INTEGER PRIMARY KEY ,
    photo_url TEXT,
    categoryLabel TEXT ,
    title TEXT 
  )""";

  Future<void> clear () async {
    await _db.delete(tableName);
  }

  Future<void> insert(FeaturedArticle article) async {
    await _db.insert(
        tableName,
        article.toJSON(),
        conflictAlgorithm: ConflictAlgorithm.replace,
    );
    notifyListeners();
  }

  Future<List<FeaturedArticle>?> getAllPosts() async {
    var records = await _db.query(tableName);
    if((records).isEmpty){
      return null;
    }

    return records.map((e) => FeaturedArticle.fromJson(e)).toList();
  }


}