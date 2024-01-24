import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_aps/bloc/getUser/get_user_bloc.dart';
import 'package:frontend_aps/bloc/login/login_bloc.dart';
import 'package:frontend_aps/bloc/logout/logout_bloc.dart';
import 'package:frontend_aps/data/datasources/auth_remote_datasources.dart';

class APSProvider extends StatelessWidget {
  final Widget child;
  const APSProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDataSources()),
        ),
        BlocProvider(
          create: (context) => GetUserBloc(AuthRemoteDataSources()),
        ),
      ],
      child: child,
    );
  }
}
