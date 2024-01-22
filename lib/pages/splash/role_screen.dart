import 'package:flutter/material.dart';
import 'package:frontend_aps/pages/splash/login.dart';

import 'widget/primary_btn.dart';
import 'widget/secondary_btn.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryTextTheme = Theme.of(context).primaryTextTheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Spacer(flex: 6),
            Center(
              child: Image.asset('assets/images/logo.png'),
            ),
            const Spacer(flex: 1),
            Text(
              'Aplikasi Pelanggaran Siswa',
              style: primaryTextTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            const Spacer(flex: 1),
            const Text(
              'Melani Edukasi, Memudahkan Administrasi',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const Spacer(flex: 4),
            PrimaryButton(
              name: 'CIVITAS AKADEMIK',
              onPress: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const Login(textTitle: 'Civitas Akademik')),
              ),
            ),
            const Spacer(flex: 1),
            SecondaryButton(
              name: 'SISWA',
              onPress: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Login(textTitle: 'Siswa')),
              ),
            ),
            const Spacer(flex: 4),
            Text(
              'Dengan memilih salah satu, Anda menyetujuinya',
              style: primaryTextTheme.labelMedium,
            ),
            Text(
              'Ketentuan Layanan & Kebijakan Privasi',
              style: primaryTextTheme.labelSmall,
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
