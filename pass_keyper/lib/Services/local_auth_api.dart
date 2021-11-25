import 'package:flutter/services.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      print('try hasbio');
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
      print('hasbio');
      return false;
    }
  }

  static Future<bool> isdevicesupported() async {
    try {
      print('device supported');
      return await _auth.isDeviceSupported();
    } on PlatformException catch (e) {
      print('textpassword');
      print(e);
      return false;
    }
  }

  static Future<bool> authenticate() async {
    final deviceSupported = await isdevicesupported();
    if (deviceSupported) {
      final isAvailable = await hasBiometrics();
      print(isAvailable);
      if (!isAvailable) return false;
    }
    print('s$deviceSupported');
    try {
      // ignore: deprecated_member_use
      return await _auth.authenticate(
        localizedReason: 'Scan Fingerprint to Authenticate',
        biometricOnly: true,
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print('Here');
      print(e.message);
      return false;
    }
  }
}
