abstract class IAuthBiometricsDevice<T> {
  Future<List<T>> getAvailableBiometrics();
  Future<bool> authenticate();
  Future<bool> isBiometricAvailable();
}
