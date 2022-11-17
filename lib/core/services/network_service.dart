import 'dart:convert';

import 'package:flutter_task/core/app/app.locator.dart';
import 'package:flutter_task/core/models/top_stories.dart';
import 'package:flutter_task/core/services/http_service.dart';
import 'package:http/http.dart';

class NetworkService{

  final httpService = locator<HttpService>();

  Map<String, String> get defaultHeaders {
    return {
      'X-RapidAPI-Key': '2189a6236emsh6a38f03c9767770p147fb1jsn8e1f46a9241c',
      'X-RapidAPI-Host': 'livescore6.p.rapidapi.com'
    };
  }
  
  Future<Post> getPosts() async {
    var url = "https://livescore6.p.rapidapi.com/news/v2/list";
    
    Response response = await httpService.get(
        Uri.parse(url),
      headers: defaultHeaders
    );

    return Post.fromJson(jsonDecode(response.body));
  }
}