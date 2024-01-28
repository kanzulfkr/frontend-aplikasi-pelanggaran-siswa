import 'package:flutter/material.dart';
import 'package:frontend_aps/common/widget/skelton.dart';

import '../../../../common/constant/aps_color.dart';

class LoadingDetailStudentViolation extends StatelessWidget {
  const LoadingDetailStudentViolation({
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
                        Skelton(height: 20, width: 200),
                        Skelton(height: 20, width: 150),
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
                Skelton(height: 25, width: 100)
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
            const Skelton(height: 35, width: 0),
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
                  Skelton(height: 20, width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skelton(height: 20, width: 240),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Skelton(height: 20, width: 240),
                      ),
                      Skelton(height: 20, width: 100),
                    ],
                  ),
                  Skelton(height: 20, width: 30),
                ],
              ),
            ),
            const Divider(thickness: 1.5),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Skelton(height: 20, width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skelton(height: 20, width: 240),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Skelton(height: 20, width: 240),
                      ),
                      Skelton(height: 20, width: 100),
                    ],
                  ),
                  Skelton(height: 20, width: 30),
                ],
              ),
            ),
            const Divider(thickness: 1.5),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Skelton(height: 20, width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skelton(height: 20, width: 240),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Skelton(height: 20, width: 240),
                      ),
                      Skelton(height: 20, width: 100),
                    ],
                  ),
                  Skelton(height: 20, width: 30),
                ],
              ),
            ),
            const Divider(thickness: 1.5),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Skelton(height: 20, width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skelton(height: 20, width: 240),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Skelton(height: 20, width: 240),
                      ),
                      Skelton(height: 20, width: 100),
                    ],
                  ),
                  Skelton(height: 20, width: 30),
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
