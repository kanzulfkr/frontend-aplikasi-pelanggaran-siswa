import 'package:flutter/material.dart';
import 'package:frontend_aps/common/constant/aps_provider.dart';
import 'package:frontend_aps/data/datasources/auth_local_datasources.dart';
import 'package:frontend_aps/pages/siswa/s_main_screen.dart';
import 'package:frontend_aps/pages/splash/role_screen.dart';
import 'package:frontend_aps/common/constant/aps_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = SiakadTheme.themeData();

    return APSProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        home: FutureBuilder(
          future: AuthLocalDataSources().isLogin(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!) {
              return const SiswaMainScreen();
            } else {
              return const RoleScreen();
            }
          },
        ),
      ),
    );
  }
}
