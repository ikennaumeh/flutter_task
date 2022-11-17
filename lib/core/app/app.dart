import 'package:flutter_task/core/data/article_store.dart';
import 'package:flutter_task/core/data/db.dart';
import 'package:flutter_task/core/services/http_service.dart';
import 'package:flutter_task/core/services/network_service.dart';
import 'package:flutter_task/core/services/service_api.dart';
import 'package:flutter_task/features/home/home_view.dart';
import 'package:flutter_task/features/splash_screen/splash_screen_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: HttpService),
    LazySingleton(classType: ServiceApi),
    LazySingleton(classType: NetworkService),
    LazySingleton(classType: ArticleStore),
    LazySingleton(classType: AppDB),
  ],
    routes: [
      AdaptiveRoute(page: SplashScreenView, initial: true),
      AdaptiveRoute(page: HomeView)
    ],
  logger: StackedLogger(),
)
class AppSetup {}