import 'package:seedapp/app/features/auth/auth_repository.dart';
import 'package:seedapp/app/features/auth/auth_store.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'provider_base.dart';

final getIt = GetIt.instance;

class AppProvider {
  static void start(List<ProviderBase> providers) {
    getIt.registerSingleton<AuthRepository>(AuthRepository());
    getIt.registerSingleton<AuthStore>(AuthStore());
    getIt.registerSingleton<Dio>(Dio());
    providers.map((e) => e.register()).toList();
  }
}
