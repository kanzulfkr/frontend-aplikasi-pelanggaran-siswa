import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_aps/bloc/getUser/get_user_bloc.dart';
import 'package:frontend_aps/common/constant/aps_theme.dart';

class GuruCardProfile extends StatelessWidget {
  const GuruCardProfile({
    super.key,
    required this.primaryTextTheme,
  });

  final TextTheme primaryTextTheme;

  String _getRoleLabel(int role) {
    switch (role) {
      case 1:
        return 'Admin';
      case 2:
        return 'Tata Tertib';
      case 3:
        return 'Wakasek Kesiswaan';
      case 4:
        return 'Wali Kelas';
      case 5:
        return 'Guru';
      case 6:
        return 'Siswa';
      case 7:
        return 'Wali Murid';
      default:
        return 'Unknown User';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserBloc, GetUserState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Center(child: CircularProgressIndicator()),
          ),
          loaded: (data) {
            return Container(
              height: 150,
              width: double.maxFinite,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: SiakadTheme.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 2,
                      blurStyle: BlurStyle.normal,
                      color: SiakadTheme.grey,
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/profile.png',
                    scale: 2.2,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          border: Border.all(
                            width: 1.4,
                            color: SiakadTheme.primaryColor,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            data.data!.roles!.toString() == '1'
                                ? 'Admin'
                                : data.data!.roles!.toString() == '2'
                                    ? 'Tata Tertib'
                                    : data.data!.roles!.toString() == '3'
                                        ? 'Wakasek Kesiswaan'
                                        : data.data!.roles!.toString() == '4'
                                            ? 'Wali Kelas'
                                            : data.data!.roles!.toString() ==
                                                    '5'
                                                ? 'Guru'
                                                : data.data!.roles!
                                                            .toString() ==
                                                        '6'
                                                    ? 'Siswa'
                                                    : data.data!.roles!
                                                                .toString() ==
                                                            '7'
                                                        ? 'Wali Murid'
                                                        : 'Unknown User',
                            // _getRoleLabel(data.data!.roles!).toString(),
                            style: primaryTextTheme.bodySmall,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        child: Text(
                          data.data!.name!,
                          style: primaryTextTheme.displaySmall,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Text(
                        data.data!.email!,
                        style: primaryTextTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          error: (message) => Center(child: Text(message)),
          orElse: () => const Center(child: Text("User Not Found")),
        );
      },
    );
  }
}
