import 'package:flutter/material.dart';
import 'package:frontend_aps/common/widget/skelton.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../common/constant/aps_color.dart';
import '../../../../common/widget/btn_secondary.dart';
import '../../pages/s_detail_violation_screen.dart';
import '../point_row_title.dart';

class LoadingCheckPoint extends StatelessWidget {
  const LoadingCheckPoint({
    super.key,
    required this.hideTitle,
  });
  final bool hideTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            hideTitle
                ? const RowTitle(rowTitle: 'Akumulasi Poin Siswa')
                : const SizedBox(height: 20),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleSkeleton(size: 60),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    margin: const EdgeInsets.only(left: 5),
                    height: 80,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Skelton(height: 20, width: 200),
                        Skelton(height: 20, width: 150),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(thickness: 1.5),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Poin :',
                  style: TextStyle(
                    color: ApsColor.primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Skelton(height: 25, width: 100)
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Pelanggaran :',
                    style: TextStyle(
                      color: ApsColor.primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Skelton(height: 25, width: 100)
                ],
              ),
            ),
            const Text(
              'Status :',
              style: TextStyle(
                color: ApsColor.primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Skelton(height: 35, width: 0),
            ),
            const Divider(thickness: 1.5),
            const SizedBox(height: 10),
            CircularPercentIndicator(
              animation: true,
              restartAnimation: true,
              animationDuration: 1000,
              radius: 120,
              lineWidth: 40,
              percent: 0,
              progressColor: Colors.indigo.shade200,
              backgroundColor: Colors.indigo.shade100,
              circularStrokeCap: CircularStrokeCap.round,
              animateFromLastPercent: true,
              center: const Skelton(height: 30, width: 70),
              footer: Padding(
                padding: const EdgeInsets.only(top: 20, right: 50, left: 50),
                child: SecondaryButton(
                    name: 'Lihat Detail Pelanggaran',
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const DetailSiswaViolationScreen()),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
