
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';

class KeyHash {
  static const MethodChannel _channel =
      const MethodChannel('key_hash');

  static Future<String> get getKeyHash async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    print(packageName);

    final String version1 = await _channel.invokeMethod('getKeyHash', packageName);
    return version1;
  }
}
