import 'dart:async';

import 'package:flutter_task/core/app/app.locator.dart';
import 'package:flutter_task/core/app/app.logger.dart';
import 'package:flutter_task/core/app/app.router.dart';
import 'package:flutter_task/core/services/service_api.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewVM extends BaseViewModel{
  final logger = getLogger("SplashViewVM");
  final _navigationService = locator<NavigationService>();
  final api = locator<ServiceApi>();

  Future<void> initDatabase() async {
    try {
      await api.initDatabase();
      startUpLogic();
    } catch(e) {
      logger.e('Error while initialising local database: ${e.toString()}');
    }
  }

  void _initialize() async {
    _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
    return;
  }

  Future<void> startUpLogic() async {
    Duration duration = const Duration(seconds: 4);
    Timer(duration, _initialize);
  }

}