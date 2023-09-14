import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'cache_model.dart';

class BoxCache {
  static Future<void> startAsync({required List<CacheModel> caches}) async {
    try {
      await Hive.initFlutter();
      final box = caches.map((e) => e.box).toList();
      final adpaters = caches.map((e) => e.registerAdapters).toList();

      adpaters;
      final futures = box.map(Hive.openBox).toList();
      await Future.wait(futures);
    } on Exception catch (_, e) {
      debugPrint("Exception (BoxCache.startAsync): Error: $e");
    }
  }
}
