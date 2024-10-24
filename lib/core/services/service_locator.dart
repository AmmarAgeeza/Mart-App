import 'package:get_it/get_it.dart';
import 'package:mart_app/core/database/cache/cache_consumer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/cache/shared_prefs_consumer.dart';

final sl = GetIt.instance;
Future<void> serviceLocatorInit() async {
  // repositories
  // External
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<CacheConsumer>(() => CacheHelper(sharedPreferences));
}
