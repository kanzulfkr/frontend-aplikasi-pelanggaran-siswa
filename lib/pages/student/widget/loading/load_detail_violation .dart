import 'package:flutter/material.dart';
import 'package:frontend_aps/common/widget/skelton.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../common/constant/aps_color.dart';
import '../../../../common/widget/btn_secondary.dart';
import '../../pages/s_detail_violation_screen.dart';

class LoadingDetailViolation extends StatelessWidget {
  const LoadingDetailViolation({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 20),
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
                        Skeleton(height: 20, width: 200),
                        Skeleton(height: 20, width: 150),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(thickness: 1.5, height: 35),
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
                Skeleton(height: 25, width: 100)
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Status :',
                style: TextStyle(
                  color: ApsColor.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Skeleton(height: 35, width: 0),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Data Pelanggaran :',
                    style: TextStyle(
                      color: ApsColor.primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Poin :',
                    style: TextStyle(
                      color: ApsColor.primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Skeleton(height: 20, width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeleton(height: 20, width: 240),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Skeleton(height: 20, width: 240),
                      ),
                      Skeleton(height: 20, width: 100),
                    ],
                  ),
                  Skeleton(height: 20, width: 30),
                ],
              ),
            ),
            const Divider(thickness: 1.5),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Skeleton(height: 20, width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeleton(height: 20, width: 240),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Skeleton(height: 20, width: 240),
                      ),
                      Skeleton(height: 20, width: 100),
                    ],
                  ),
                  Skeleton(height: 20, width: 30),
                ],
              ),
            ),
            const Divider(thickness: 1.5),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Skeleton(height: 20, width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeleton(height: 20, width: 240),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Skeleton(height: 20, width: 240),
                      ),
                      Skeleton(height: 20, width: 100),
                    ],
                  ),
                  Skeleton(height: 20, width: 30),
                ],
              ),
            ),
            const Divider(thickness: 1.5),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Skeleton(height: 20, width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeleton(height: 20, width: 240),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Skeleton(height: 20, width: 240),
                      ),
                      Skeleton(height: 20, width: 100),
                    ],
                  ),
                  Skeleton(height: 20, width: 30),
                ],
              ),
            ),
            const Divider(thickness: 1.5),
          ],
        ),
      ),
    );
  }
}
