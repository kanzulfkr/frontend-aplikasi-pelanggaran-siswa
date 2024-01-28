import 'package:flutter/material.dart';
import 'package:frontend_aps/common/widget/custom_app_bar.dart';
import '../../common/constant/aps_color.dart';
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
    return Scaffold(
      appBar: const CustomAppBar(title: 'Masuk'),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const SizedBox(height: 100),
              const Text(
                'Silahkan Login',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: '',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Masuk sebagai ${widget.textTitle} dengan email dan password agar dapat mengakses aplikasi ini.',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: '',
                ),
              ),
              const SizedBox(height: 5),
              FormInputEmail(emailController: emailController),
              const SizedBox(height: 20),
              const Text(
                'Kata Sandi',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: '',
                ),
              ),
              const SizedBox(height: 5),
              FormInputPassword(passwordController: passwordController),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              LoginButton(
                emailController: emailController,
                passwordController: passwordController,
                formKey: _formKey,
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum Punya Akun ?',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    ' Buat Akun',
                    style: TextStyle(
                      color: ApsColor.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
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
