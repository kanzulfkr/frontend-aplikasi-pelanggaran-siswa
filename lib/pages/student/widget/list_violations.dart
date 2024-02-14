import 'package:flutter/material.dart';
import 'package:frontend_aps/common/constant/aps_color.dart';
import 'package:frontend_aps/data/models/response/user_poin_response_models.dart';
import 'package:intl/intl.dart';

class ListViolations extends StatelessWidget {
  const ListViolations({
    super.key,
    required this.i,
    required this.violation,
  });
  final int i;
  final Violation violation;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          i.toString(),
          style: const TextStyle(
            color: ApsColor.primaryColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          width: 260,
          margin: const EdgeInsets.only(right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                overflow: TextOverflow.fade,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(
                      text:
                          '[${DateFormat("dd MMM yyyy").format(violation.createdAt)}] ',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: violation.violationsTypesName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              // RichText(
              //   overflow: TextOverflow.fade,
              //   maxLines: 3,
              //   text: TextSpan(
              //     style: DefaultTextStyle.of(context).style,
              //     children: [
              //       const TextSpan(
              //         text: 'Tipe Pelanggaran :',
              //         style: TextStyle(
              //           fontSize: 14,
              //           fontWeight: FontWeight.w700,
              //         ),
              //       ),
              //       TextSpan(
              //         text: ' ${violation.type}',
              //         style: const TextStyle(
              //           fontSize: 14,
              //           fontWeight: FontWeight.w700,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // RichText(
              //   overflow: TextOverflow.fade,
              //   maxLines: 3,
              //   text: TextSpan(
              //     style: DefaultTextStyle.of(context).style,
              //     children: [
              //       const TextSpan(
              //         text: 'Petugas :',
              //         style: TextStyle(
              //           fontSize: 14,
              //           fontWeight: FontWeight.w700,
              //         ),
              //       ),
              //       TextSpan(
              //         text: ' ${violation.officerName}',
              //         style: const TextStyle(
              //           fontSize: 14,
              //           fontWeight: FontWeight.w700,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // RichText(
              //   overflow: TextOverflow.fade,
              //   maxLines: 3,
              //   text: TextSpan(
              //     style: DefaultTextStyle.of(context).style,
              //     children: [
              //       const TextSpan(
              //         text: 'Catatan :',
              //         style: TextStyle(
              //           fontSize: 14,
              //           fontWeight: FontWeight.w700,
              //         ),
              //       ),
              //       TextSpan(
              //         text: ' ${violation.catatan}',
              //         style: const TextStyle(
              //           fontSize: 14,
              //           fontWeight: FontWeight.normal,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
        Text(
          violation.point.toString(),
          textAlign: TextAlign.end,
          style: const TextStyle(
            color: ApsColor.primaryColor,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
