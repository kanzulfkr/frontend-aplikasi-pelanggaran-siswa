import 'package:flutter/material.dart';
import 'widget/login_button.dart';
import 'widget/login_form_input_email.dart';
import 'widget/login_form_input_password.dart';

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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryTextTheme = Theme.of(context).primaryTextTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Masuk'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const SizedBox(height: 40),
              const Text(
                'Selamat Datang',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Masuk sebagai ${widget.textTitle} dengan email dan password agar dapat mengakses aplikasi ini.',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 40),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              FormInputEmail(emailController: emailController),
              const SizedBox(height: 20),
              const Text(
                'Kata Sandi',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              FormInputPassword(passwordController: passwordController),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Icon(Icons.lock_outline),
                  SizedBox(width: 8),
                  Text(
                    'Kami akan melindungi data anda.',
                    style: TextStyle(fontSize: 13, fontFamily: 'Poppins'),
                  )
                ],
              ),
              const SizedBox(height: 20),
              LoginButton(
                emailController: emailController,
                passwordController: passwordController,
                formKey: _formKey,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Belum Punya Akun?',
                      style: primaryTextTheme.labelMedium),
                  TextButton(
                    onPressed: () {},
                    child:
                        Text('Buat Akun', style: primaryTextTheme.labelSmall),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
