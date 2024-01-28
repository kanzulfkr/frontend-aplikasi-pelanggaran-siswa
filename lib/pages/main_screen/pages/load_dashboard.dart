import 'package:flutter/material.dart';
import 'package:frontend_aps/common/widget/skelton.dart';

import '../../../common/constant/aps_color.dart';

class LoadingDashboard extends StatelessWidget {
  const LoadingDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Aplikasi Pelanggaran Siswa',
                  style: TextStyle(
                    color: ApsColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: '',
                  ),
                ),
                Icon(
                  Icons.notifications_rounded,
                  color: ApsColor.primaryColor,
                  size: 30,
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Skelton(height: 60, width: double.maxFinite),
            SizedBox(
              height: 550,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: ApsColor.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          blurStyle: BlurStyle.normal,
                          color: Color.fromARGB(255, 218, 213, 213),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Skelton(height: 25, width: 150),
                            Skelton(height: 25, width: 150),
                            Skelton(height: 25, width: 100),
                          ],
                        ),
                        Container(
                          height: 80,
                          margin: const EdgeInsets.only(right: 20),
                          child: const CircleSkeleton(size: 80),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
