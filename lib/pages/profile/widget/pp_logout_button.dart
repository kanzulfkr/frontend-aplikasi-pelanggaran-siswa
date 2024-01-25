import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_aps/pages/splash/role_screen.dart';
import 'package:frontend_aps/pages/splash/splash_screen.dart';
import '../../../bloc/logout/logout_bloc.dart';
import '../../../common/widget/btn_warning.dart';
import '../../../data/datasources/auth_local_datasources.dart';
import '../../auth/widget/pop_up_message.dart';

class PpLogoutButton extends StatelessWidget {
  const PpLogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutBloc, LogoutState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          orElse: () => WarningButton(
            name: 'Logout',
            onPress: () {
              context.read<LogoutBloc>().add(const LogoutEvent.logout());
            },
          ),
        );
      },
      listener: (context, state) {
        state.maybeWhen(
          loaded: (success) async {
            await AuthLocalDataSources().removeToken();
            if (context.mounted) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const RoleScreen();
              }));
            }
            // if (context.mounted) {
            //   await showDialog(
            //     context: context,
            //     builder: (context) => PopUpMessage(
            //       message: success,
            //       backgroundColor: Colors.green,
            //     ),
            //   );
            // if (context.mounted) {
            // Navigator.pushAndRemoveUntil(
            //   context,
            //   MaterialPageRoute(builder: (context) => const RoleScreen()),
            //   (Route<dynamic> route) => false,
            // );
            // Navigator.of(context).pop();
            // Navigate.pushReplacement(const RoleScreen());
            // }
          },
          error: (error) async {
            await showDialog(
              context: context,
              builder: (context) => PopUpMessage(
                message: error,
                backgroundColor: Colors.red,
              ),
            );
          },
          orElse: () {},
        );
      },
    );
  }
}
