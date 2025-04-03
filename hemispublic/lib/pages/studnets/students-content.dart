import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hemispublic/models/students.dart';
import 'package:hemispublic/models/university.dart';
import 'package:hemispublic/widgets/mycard.dart';

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
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              MyCard(
                title: "Ta'lim turi bo'yicha",
                child: Column(
                  children: [
                    Container(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: PieChart(
                          PieChartData(
                            borderData: FlBorderData(
                              show: false,
                            ),
                            sectionsSpace: 0,
                            centerSpaceRadius: 40,
                            sections: List<PieChartSectionData>.filled(
                              4,
                              PieChartSectionData(
                                color: Colors.blueAccent,
                                value: 12,
                                title: "tset",
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
