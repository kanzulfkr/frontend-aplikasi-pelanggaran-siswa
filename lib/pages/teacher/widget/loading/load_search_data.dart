import 'package:flutter/material.dart';

import '../../../../common/widget/skelton.dart';

class LoadingSearchData extends StatelessWidget {
  const LoadingSearchData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Skelton(height: 20, width: double.maxFinite),
        ),
        // SizedBox(
        //   height: 120,
        //   child: ListView.builder(
        //     itemCount: 1,
        //     itemBuilder: (context, index) {
        //       return Container(
        //         margin: const EdgeInsets.only(bottom: 15),
        //         width: double.maxFinite,
        //         color: Colors.white,
        //         child: const Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             ListTile(
        //               leading: CircleSkelton(size: 50),
        //               title: Padding(
        //                 padding: EdgeInsets.only(bottom: 10),
        //                 child: Skelton(height: 20, width: 150),
        //               ),
        //               subtitle: Skelton(height: 20, width: 100),
        //               trailing: Skelton(height: 20, width: 70),
        //             ),
        //             Divider(thickness: 1.5, height: 10),
        //             SizedBox(height: 10),
        //             Padding(
        //               padding: EdgeInsets.only(bottom: 10, right: 20, left: 20),
        //               child: Skelton(height: 20, width: double.maxFinite),
        //             ),
        //             SizedBox(height: 5),
        //           ],
        //         ),
        //       );
        //     },
        //   ),
        // ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 520,
          child: ListView.builder(
            itemCount: 9,
            itemBuilder: (context, index) {
              return Container(
                width: double.maxFinite,
                margin: const EdgeInsets.fromLTRB(3, 0, 3, 1),
                decoration: BoxDecoration(
                  borderRadius: index == 0
                      ? const BorderRadius.vertical(
                          top: Radius.circular(15),
                        )
                      : index == 8
                          ? const BorderRadius.vertical(
                              bottom: Radius.circular(15),
                            )
                          : const BorderRadius.vertical(),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const ListTile(
                  title: Skelton(height: 20, width: 0),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
