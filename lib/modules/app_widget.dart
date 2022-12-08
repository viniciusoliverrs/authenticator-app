import 'package:flutter/material.dart';

import 'app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: Routes.auth,
      onGenerateRoute: Routes.generateRoute,
      title: 'Biometric Auth App',
    );
  }
}
