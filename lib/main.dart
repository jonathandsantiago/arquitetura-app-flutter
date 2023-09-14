import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'app/app_page.dart';
import 'app/core/chaches/box_cache.dart';
import 'app/core/providers/app_provider.dart';
import 'env/env_properties.dart';

Future<void> main() async {
  EasyLoading.init();
  WidgetsFlutterBinding.ensureInitialized();
  EnvProperties().init();
  AppProvider.start([
  ]);
  await BoxCache.startAsync(caches: [
  ]);
  return runApp(const AppPage());
}
