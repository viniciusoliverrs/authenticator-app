import 'package:authenticator_app/setup_locate.dart';
import 'package:flutter/material.dart';

import '../../core/routes.dart';
import '../controllers/auth_controllers.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final ValueNotifier<bool> isLocalAuthFailed = ValueNotifier(false);
  final AuthController _authController = getIt<AuthController>();
  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  checkAuth() async {
    final isBiometric = await _authController.isBiometricAvailable();
    isLocalAuthFailed.value = false;

    if (isBiometric) {
      final authenticated = await _authController.checkAuthenticate();

      if (!authenticated) {
        isLocalAuthFailed.value = true;
      } else {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, Routes.home);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: ValueListenableBuilder<bool>(
          valueListenable: isLocalAuthFailed,
          builder: (_, failed, __) {
            if (failed) {
              return ElevatedButton(
                onPressed: checkAuth,
                child: const Text("Try again "),
              );
            }
            return const SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
