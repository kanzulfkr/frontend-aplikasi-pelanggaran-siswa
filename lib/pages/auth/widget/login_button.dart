import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/login/login_bloc.dart';
import '../../../common/widget/btn_primary.dart';
import '../../../data/datasources/auth_local_datasources.dart';
import '../../../data/models/request/auth_request_models.dart';
import '../../teacher/g_main_screen.dart';
import '../../student/s_main_screen.dart';
import 'pop_up_message.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          orElse: () => PrimaryButton(
            name: 'Login',
            onPress: () {
              if (formKey.currentState!.validate()) {
                final loginModel = AuthRequestModels(
                  email: emailController.text,
                  password: passwordController.text,
                );
                context.read<LoginBloc>().add(LoginEvent.login(loginModel));
              }
            },
          ),
        );
      },
      listener: (context, state) {
        state.maybeWhen(
          loaded: (data) async {
            AuthLocalDataSources().saveAuthData(data);
            final roles = data.data.roles;

            // await showDialog(
            //   context: context,
            //   builder: (context) => PopUpMessage(
            //     message: getMessageForRole(roles),
            //     backgroundColor: Colors.greenAccent,
            //   ),
            // );
            if (roles == '6' || roles == '7') {
              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SiswaMainScreen()),
                  (Route<dynamic> route) => false,
                );
              }
            } else {
              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GuruMainScreen()),
                  (Route<dynamic> route) => false,
                );
              }
            }
          },
          error: (message) async {
            await showDialog(
              context: context,
              builder: (context) => PopUpMessage(
                message: message,
                backgroundColor: const Color.fromARGB(255, 178, 9, 9),
              ),
            );
          },
          orElse: () => const Center(child: Text('Lemot')),
        );
      },
    );
  }
}
