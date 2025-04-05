import 'package:flutter/cupertino.dart';
import 'package:hemispublic/models/employers.dart';
import 'package:hemispublic/models/university.dart';
import 'package:hemispublic/utils/utils.dart';
import 'package:hemispublic/widgets/chart/barchart.dart';
import 'package:hemispublic/widgets/chart/piechart.dart';
import 'package:hemispublic/widgets/mycard.dart';

class EmployersContent extends StatelessWidget {
  const EmployersContent({
    super.key,
    required this.employers,
    required this.university,
  });

  final Employers employers;
  final University university;
  @override
  Widget build(BuildContext context) {
    Map<String, Map<String, dynamic>> academicDegree = normalizeMap(
      employers.academic_degree,
    );

    Map<String, Map<String, dynamic>> academicRank = normalizeMap(
      employers.academic_rank,
    );

    employers.gender.remove("Jami");
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              SizedBox(height: 24),
              MyCard(
                title: "Jinsi, fuqaroligi va daraja bo'yicha",
                child: Column(
                  children: [
                    SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text("Jinsi"),
                              MapPieChart(
                                data: employers.gender,
                              ),
                              SizedBox(height: 12),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Fuqaroligi"),
                              MapPieChart(
                                data: employers.citizenship,
                              ),
                              SizedBox(height: 12),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Darajasi"),
                              MapPieChart(
                                data: employers.academic,
                              ),
                              SizedBox(height: 12),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
              SizedBox(height: 24),
              MyCard(
                title: "Lavozimi bo'yicha",
                child: Column(
                  children: [
                    SizedBox(height: 12),
                    GroupBarChart(
                      data: employers.position,
                      labelAngle: 0,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              MyCard(
                title: "Ilmiy daraja bo'yicha",
                child: Column(
                  children: [
                    SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          ...academicDegree.keys.map((e) {
                            return Column(
                              children: [
                                Text(e),
                                MapPieChart(data: academicDegree[e]!),
                                SizedBox(height: 12),
                              ],
                            );
                          }),
                          Column(
                            children: [
                              Text("Umumiy"),
                              MapPieChart(
                                data:
                                    getSubMapValSumm(employers.academic_degree),
                              ),
                              SizedBox(height: 12),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
              SizedBox(height: 24),
              MyCard(
                title: "Ilmiy unvon bo'yicha",
                child: Column(
                  children: [
                    SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          ...academicRank.keys.map((e) {
                            return Column(
                              children: [
                                Text(e),
                                MapPieChart(data: academicRank[e]!),
                                SizedBox(height: 12),
                              ],
                            );
                          }),
                          Column(
                            children: [
                              Text("Umumiy"),
                              MapPieChart(
                                data: getSubMapValSumm(
                                  employers.academic_rank,
                                ),
                              ),
                              SizedBox(height: 12),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
              SizedBox(height: 24),
              MyCard(
                title: "Ishga joylashish shakli",
                child: Column(
                  children: [
                    SizedBox(height: 12),
                    GroupBarChart(
                      data: employers.employment_form,
                      labelAngle: 0,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        )
      ],
    );
  }
}
