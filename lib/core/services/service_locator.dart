import 'package:get_it/get_it.dart';
import 'package:mart_app/core/database/cache/cache_consumer.dart';
import 'package:mart_app/core/database/firebase/database_service.dart';
import 'package:mart_app/core/database/firebase/firebase_auth_service.dart';
import 'package:mart_app/core/database/firebase/firestore_service.dart';
import 'package:mart_app/features/auth/data/repos/reset_password_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/repos/login_repo.dart';
import '../../features/auth/data/repos/register_repo.dart';
import '../database/cache/shared_prefs_consumer.dart';

final sl = GetIt.instance;
Future<void> serviceLocatorInit() async {
  // repositories
  sl.registerLazySingleton(
      () => RegisterRepo(databaseService: sl(), firebaseAuthService: sl()));
  sl.registerLazySingleton(() => ResetPasswordRepo(firebaseAuthService: sl()));
  sl.registerLazySingleton(() => LoginRepo(
      databaseService: sl(), firebaseAuthService: sl(), registerRepo: sl()));
  // chache helper
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton<CacheConsumer>(() => CacheHelper(sharedPreferences));
  //firebase services
  sl.registerLazySingleton<DatabaseService>(() => FireStoreService());
  sl.registerLazySingleton(() => FirebaseAuthService());
}
