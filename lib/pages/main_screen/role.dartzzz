import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_aps/pages/student/s_main_screen.dart';
import 'package:frontend_aps/pages/teacher/g_main_screen.dart';
import '../../../../bloc/getUser/get_user_bloc.dart';
import 'default_main_screen.dart';

class Role extends StatefulWidget {
  const Role({super.key});

  @override
  State<Role> createState() => _RoleState();
}

class _RoleState extends State<Role> {
  @override
  void initState() {
    super.initState();
    context.read<GetUserBloc>().add(const GetUserEvent.getProfile());
    log("Get User in Role");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserBloc, GetUserState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return const DefaultMainScreen();
          },
          loaded: (data) {
            return data.data!.roles == '6' || data.data!.roles == '7'
                ? const SiswaMainScreen()
                : const GuruMainScreen();
          },
          error: (message) => const DefaultMainScreen(),
          orElse: () {
            return const DefaultMainScreen();
          },
        );
      },
    );
  }
}
