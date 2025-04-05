import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:hemispublic/models/employers.dart';
import 'package:hemispublic/models/infrastructure.dart';
import 'package:hemispublic/models/university.dart';
import 'package:hemispublic/utils/utils.dart';
import 'package:hemispublic/widgets/chart/barchart.dart';
import 'package:hemispublic/widgets/mycard.dart';

class InfrastructureContent extends StatelessWidget {
  const InfrastructureContent({
    super.key,
    required this.infrastructure,
    required this.university,
  });

  final Infrastructure infrastructure;
  final University university;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              SizedBox(height: 24),
              MyCard(
                title: "Guruhlar bo'yicha",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: infrastructure.groups.keys.map((e) {
                          if (getMapValSumm(infrastructure.groups[e]) <= 0) {
                            return const SizedBox();
                          }
                          return Column(
                            children: [
                              Text(e),
                              GroupBarChart(
                                data: infrastructure.groups[e],
                                labelAngle: 0,
                              ),
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
                title: "Auditoriya bo'yicha",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 12),
                    GroupBarChart(
                      data: getSubListValSumm(infrastructure.auditoriums),
                      labelAngle: 0,
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
              SizedBox(height: 24),
              MyCard(
                title: "Mutaxassisliklar bo'yicha",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 12),
                    GroupBarChart(
                      data: getSubListValSumm(infrastructure.auditoriums),
                      labelAngle: 0,
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
              SizedBox(height: 24),
              MyCard(
                title: "Bo'limlari bo'yicha",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 12),
                    GroupBarChart(
                      data: getSubListValSumm(infrastructure.departments),
                      labelAngle: 0,
                    ),
                    SizedBox(height: 12),
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
