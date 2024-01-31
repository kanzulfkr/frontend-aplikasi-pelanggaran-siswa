import 'package:flutter/material.dart';

import '../../../../common/widget/skelton.dart';
import '../../student/widget/point_row_title.dart';

class LoadingViolation extends StatelessWidget {
  const LoadingViolation({super.key, required this.hideTitlev});
  final bool hideTitlev;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            hideTitlev
                ? const SizedBox()
                : const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: RowTitle(
                      rowTitle: 'Data Pelanggaran Siswa',
                    ),
                  ),
            SizedBox(
              height: 700,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    width: double.maxFinite,
                    color: Colors.white,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: CircleSkelton(size: 50),
                          title: Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Skelton(height: 20, width: 150),
                          ),
                          subtitle: Skelton(height: 20, width: 100),
                          trailing: Skelton(height: 20, width: 70),
                        ),
                        Divider(thickness: 1.5, height: 10),
                        SizedBox(height: 10),
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: 10, right: 20, left: 20),
                          child: Skelton(height: 20, width: double.maxFinite),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
