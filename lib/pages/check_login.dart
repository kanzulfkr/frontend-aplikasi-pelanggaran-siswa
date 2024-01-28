import 'package:flutter/material.dart';
import 'package:frontend_aps/pages/main_screen/check_role.dart';
import 'package:frontend_aps/pages/splash/role_screen.dart';

import '../data/datasources/auth_local_datasources.dart';

class CheckLogin extends StatelessWidget {
  const CheckLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthLocalDataSources().isLogin(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!) {
          return const CheckRole();
        } else {
          return const RoleScreen();
        }
      },
    );
  }
}
