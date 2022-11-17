// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_core/stacked_core.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';

import '../data/article_store.dart';
import '../data/db.dart';
import '../services/http_service.dart';
import '../services/network_service.dart';
import '../services/service_api.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => HttpService());
  locator.registerLazySingleton(() => ServiceApi());
  locator.registerLazySingleton(() => NetworkService());
  locator.registerLazySingleton(() => ArticleStore());
  locator.registerLazySingleton(() => AppDB());
}
