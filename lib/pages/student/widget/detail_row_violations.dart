import 'package:flutter/material.dart';
import 'package:frontend_aps/common/constant/aps_color.dart';
import 'package:intl/intl.dart';

class RowViolations extends StatelessWidget {
  const RowViolations({
    super.key,
    required this.i,
    required this.violationName,
    required this.violationDate,
    required this.catatan,
    required this.type,
    required this.officer,
    required this.point,
  });
  final int i;
  final String violationName;
  final DateTime violationDate;
  final String catatan;
  final String type;
  final String officer;
  final int point;

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
                          '[${DateFormat("dd MMM yyyy").format(violationDate)}] ',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: violationName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                overflow: TextOverflow.fade,
                maxLines: 3,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    const TextSpan(
                      text: 'Tipe Pelanggaran :',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: ' $type',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                overflow: TextOverflow.fade,
                maxLines: 3,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    const TextSpan(
                      text: 'Petugas :',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: ' $officer',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                overflow: TextOverflow.fade,
                maxLines: 3,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    const TextSpan(
                      text: 'Catatan :',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: ' $catatan',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Text(
          point.toString(),
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
