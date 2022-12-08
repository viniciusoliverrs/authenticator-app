import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import '../../infraestruture/devices/iauth_biometrics_device.dart';

class AuthBiometricsDevice implements IAuthBiometricsDevice<BiometricType> {
  final LocalAuthentication auth;
  AuthBiometricsDevice({required this.auth});

  @override
  Future<bool> authenticate() async {
    try {
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Please authenticate to show account balance');
      return didAuthenticate;
    } on PlatformException {
      return false;
    }
  }

  @override
  Future<List<BiometricType>> getAvailableBiometrics() async {
    return await auth.getAvailableBiometrics();
  }

  @override
  Future<bool> isBiometricAvailable() async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    return canAuthenticateWithBiometrics || await auth.isDeviceSupported();
  }
}
