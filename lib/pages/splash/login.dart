import 'package:flutter/material.dart';
import 'package:frontend_aps/pages/siswa/main_page.dart';
import 'package:frontend_aps/pages/splash/register.dart';
import 'package:frontend_aps/pages/splash/widget/primary_btn.dart';
import 'package:frontend_aps/utils/aps_theme.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
    required this.textTitle,
  });
  final String textTitle;
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final primaryTextTheme = Theme.of(context).primaryTextTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Masuk'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 2),
            const Text(
              'Selamat Datang',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const Spacer(flex: 1),
            Text(
              'Masuk sebagai ${widget.textTitle} dengan username dan password agar dapat mengakses aplikasi ini.',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              textAlign: TextAlign.justify,
            ),
            const Spacer(flex: 6),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Username',
                hintStyle:
                    TextStyle(color: SiakadTheme.grey, letterSpacing: 0.4),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Password',
                hintStyle:
                    TextStyle(color: SiakadTheme.grey, letterSpacing: 0.4),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 2),
            PrimaryButton(
              name: 'Masuk',
              onPress: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainPage()),
                );
              },
            ),
            const Spacer(flex: 2),
            const Center(
              child: Text('Lupa Password ?'),
            ),
            const Spacer(flex: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Belum Punya Akun?', style: primaryTextTheme.labelMedium),
                // Text('Buat Akun', style: primaryTextTheme.labelSmall),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Register()),
                    );
                  },
                  child: Text('Buat Akun', style: primaryTextTheme.labelSmall),
                )
              ],
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
