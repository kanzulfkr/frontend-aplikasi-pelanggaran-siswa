import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_aps/common/constant/aps_provider.dart';
import 'package:frontend_aps/common/constant/aps_color.dart';
import 'package:frontend_aps/pages/splash/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return APSProvider(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          systemNavigationBarColor: ApsColor.primaryColor,
          statusBarColor: ApsColor.primaryColor,
        ),
        child: MaterialApp(
          title: 'Aplikasi Pelanggaran Siswa',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: ApsColor.primaryColor,
            ),
            useMaterial3: true,
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
