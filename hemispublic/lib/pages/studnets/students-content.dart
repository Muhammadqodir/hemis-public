import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hemispublic/models/students.dart';
import 'package:hemispublic/models/university.dart';
import 'package:hemispublic/utils/themes.dart';
import 'package:hemispublic/utils/utils.dart';
import 'package:hemispublic/widgets/chart/barchart.dart';
import 'package:hemispublic/widgets/mycard.dart';
import 'package:hemispublic/widgets/chart/piechart.dart';

class StudentsContent extends StatelessWidget {
  const StudentsContent({
    super.key,
    required this.students,
    required this.university,
  });

  final Students students;
  final University university;

  @override
  Widget build(BuildContext context) {
    Map<String, Map<String, dynamic>> accommodation = normalizeMap(
      students.accommodation,
    );
    Map<String, Map<String, dynamic>> citizenship = normalizeMap(
      students.citizenship,
    );
    Map<String, Map<String, dynamic>> regions = normalizeMap(
      students.region,
    );
    Map<String, Map<String, dynamic>> payments = normalizeMap(
      students.payment,
    );

    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              SizedBox(height: 24),
              MyCard(
                title: "Ta'lim darajasi bo'yicha",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: students.education_type.keys.map((e) {
                          if (getMapValSumm(students.education_type[e]) <= 0) {
                            return const SizedBox();
                          }
                          return Column(
                            children: [
                              Text(e),
                              MapPieChart(data: students.education_type[e]),
                              SizedBox(height: 12),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              MyCard(
                title: "To'lo'v turi bo'yicha",
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: payments.keys.map((e) {
                          if (getMapValSumm(payments[e]!) <= 0) {
                            return const SizedBox();
                          }
                          return Column(
                            children: [
                              Text(e),
                              MapPieChart(data: payments[e]!),
                              SizedBox(height: 12),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              MyCard(
                title: "Viloyatlar bo'yicha",
                child: Column(
                  children: regions.keys.map((e) {
                    if (getMapValSumm(regions[e]!) <= 0) {
                      return const SizedBox();
                    }
                    return Column(
                      children: [
                        Text(
                          e,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(height: 12),
                        GroupBarChart(
                          data: regions[e]!,
                          labelAngle: 6,
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 24),
              MyCard(
                title: "Fuqarolik bo'yicha",
                child: SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: citizenship.keys.map((e) {
                      if (getMapValSumm(citizenship[e]!) <= 0) {
                        return const SizedBox();
                      }
                      return Column(
                        children: [
                          Text(
                            e,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          MapPieChart(
                            data: citizenship[e]!,
                          ),
                          SizedBox(height: 12),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 24),
              MyCard(
                title: "Turar joy bo'yicha",
                child: Row(
                  children: accommodation.keys.map((e) {
                    if (getMapValSumm(accommodation[e]!) <= 0) {
                      return const SizedBox();
                    }
                    return Expanded(
                      child: Column(
                        children: [
                          Text(
                            e,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(height: 12),
                          GroupBarChart(
                            data: accommodation[e]!,
                            labelAngle: 0,
                            color: Theme.of(context).textTheme.bodyMedium!.color!,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 24),
              // MyCard(
              //   title: "Ta'lim turi bo'yicha",
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: GroupBarChart(
              //           data: students.education_form["Bakalavr"],
              //           labelAngle: 0,
              //         ),
              //       ),
              //       Expanded(
              //         child: GroupBarChart(
              //           data: students.education_form["Magistr"],
              //           labelAngle: 0,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        )
      ],
    );
  }
}
