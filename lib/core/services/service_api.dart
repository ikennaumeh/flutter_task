import 'package:flutter_task/core/app/app.locator.dart';
import 'package:flutter_task/core/data/db.dart';
import 'package:flutter_task/core/models/top_stories.dart';
import 'package:flutter_task/core/services/network_service.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ServiceApi{

  final networkService = locator<NetworkService>();
  final db = locator<AppDB>();

  Future<void> initDatabase() async {
    await db.init();
  }

  Future<List<FeaturedArticle>?> fetchPosts() async {

    bool result = await InternetConnectionChecker().hasConnection;

    if(result) {
      Post posts = await networkService.getPosts();

      for (var post in posts.topStories!) {
        db.articleStore.insert(post);
      }

      var results = await db.articleStore.getAllPosts();
      return results;
    }

    var results = await db.articleStore.getAllPosts();

    return results;
  }
}