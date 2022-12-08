import '../../infraestruture/devices/iauth_biometrics_device.dart';

class AuthController {
  IAuthBiometricsDevice biometricsDevice;
  AuthController({required this.biometricsDevice});

  Future<bool> isBiometricAvailable() async {
    final isBiometric = await biometricsDevice.isBiometricAvailable();
    return isBiometric;
  }

  Future<bool> checkAuthenticate() async {
    final authenticated = await biometricsDevice.authenticate();
    return authenticated;
  }
}
