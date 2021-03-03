import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:key_hash/key_hash.dart';

void main() {
  const MethodChannel channel = MethodChannel('key_hash');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await KeyHash.platformVersion, '42');
  });
}
