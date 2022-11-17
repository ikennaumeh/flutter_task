import 'dart:io';

import 'package:flutter_task/core/app/app.locator.dart';
import 'package:flutter_task/core/app/app.logger.dart';
import 'package:flutter_task/core/models/top_stories.dart';
import 'package:flutter_task/core/services/service_api.dart';
import 'package:stacked/stacked.dart';

class HomeVM extends BaseViewModel{
  final logger = getLogger("HomeVM");
  final api = locator<ServiceApi>();

  List<FeaturedArticle>? articles = [];
  String? errorMessage;

  Future<void> fetchNews() async {
    setBusy(true);
    try {
      articles = await api.fetchPosts();
      notifyListeners();

    } catch (e){
      logger.e(e.toString());
      errorMessage = "Unknown error. Please reload page";
      setError(true);
    } finally {
      setBusy(false);
    }
  }
}