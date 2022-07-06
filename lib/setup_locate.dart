import 'package:authenticator_app/infra/devices/iauth_biometrics_device.dart';
import 'package:authenticator_app/ui/controllers/auth_controllers.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';

import 'externals/devices/auth_biometrics_device.dart';

late final getIt;

void setup() {
  getIt = GetIt.instance;
  getIt.registerSingleton<IAuthBiometricsDevice>(
      AuthBiometricsDevice(auth: LocalAuthentication()));

  getIt.registerSingleton<AuthController>(
      AuthController(biometricsDevice: getIt<IAuthBiometricsDevice>()));
}
