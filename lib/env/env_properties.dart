import 'package:seedapp/env/dev.dart';
import 'package:seedapp/env/env_base.dart';
import 'package:seedapp/env/prod.dart';
import 'package:flutter/foundation.dart';

class EnvProperties {
  factory EnvProperties() {
    return _singleton;
  }

  EnvProperties._internal();

  static final EnvProperties _singleton = EnvProperties._internal();
  late EnvBase config;

  init() {
    config = _getConfig();
  }

  EnvBase _getConfig() {
    if (kReleaseMode) {
      return Prod();
    }

    return Dev();
  }
}
