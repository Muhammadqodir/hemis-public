// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hemispublic/utils/utils.dart';

class ChartIndicator extends StatelessWidget {
  const ChartIndicator({
    super.key,
    required this.color,
    required this.title,
    this.value,
  });

  final Color color;
  final String title;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 10,
          height: 10,
          color: color,
        ),
        SizedBox(width: 4),
        Text(
          value != null ? "$title: ${beautifyDouble(value!)}" : title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(width: 12)
      ],
    );
  }
}
