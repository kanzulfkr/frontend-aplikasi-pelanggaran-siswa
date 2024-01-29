import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_aps/bloc/getUser/get_user_bloc.dart';
import 'package:frontend_aps/common/constant/aps_color.dart';
import 'package:frontend_aps/pages/main_screen/pages/load_profile.dart';
import 'package:provider/provider.dart';
import '../../../provider/store_violation_provider.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserBloc, GetUserState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const LoadingProfile(),
          loaded: (data) {
            Provider.of<StoreViolationProvider>(context, listen: false);
            if (data.data!.roles == ' 6' || data.data!.roles == '7') {
            } else {
              final storeProv =
                  Provider.of<StoreViolationProvider>(context, listen: false);
              storeProv.setOfficerId(data.data!.teacherId);
              storeProv.setOfficerController(data.data!.name!);
            }
            return Container(
              height: 150,
              width: double.maxFinite,
              margin: const EdgeInsets.only(top: 40),
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: ApsColor.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 2,
                      blurStyle: BlurStyle.normal,
                      color: ApsColor.grey,
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    margin: const EdgeInsets.only(right: 25, left: 5),
                    child: Image.asset(
                      'assets/images/profile.png',
                      scale: 2.2,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 27,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          border: Border.all(
                            width: 1.4,
                            color: ApsColor.primaryColor,
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
                            style: const TextStyle(
                              color: ApsColor.primaryColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          data.data!.name!,
                          style: const TextStyle(
                            color: ApsColor.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          data.data!.roles!.toString() == '1'
                              ? data.data!.email!
                              : data.data!.roles!.toString() == '2'
                                  ? 'NIP ${data.data!.nip!}'
                                  : data.data!.roles!.toString() == '3'
                                      ? 'NIP ${data.data!.nip!}'
                                      : data.data!.roles!.toString() == '4'
                                          ? 'NIP ${data.data!.nip!}'
                                          : data.data!.roles!.toString() == '5'
                                              ? 'NIP ${data.data!.nip!}'
                                              : data.data!.roles!.toString() ==
                                                      '6'
                                                  ? 'NISN ${data.data!.nisn!}'
                                                  : data.data!.roles!
                                                              .toString() ==
                                                          '7'
                                                      ? data.data!.jobTitle!
                                                      : 'No Data',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          error: (message) => const LoadingProfile(),
          orElse: () => const Center(child: Text("User Not Found")),
        );
      },
    );
  }
}
