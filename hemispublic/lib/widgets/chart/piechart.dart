import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hemispublic/utils/themes.dart';
import 'package:hemispublic/widgets/chart/chart-indicator.dart';

class MapPieChart extends StatelessWidget {
  const MapPieChart({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  double getSum() {
    double sum = 0;
    data.forEach((key, value) {
      sum += value;
    });
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    double total = getSum();
    return SizedBox(
      width: 300,
      child: Column(
        children: [
          SizedBox(height: 6),
          SizedBox(
            height: 160,
            width: 200,
            child: AspectRatio(
              aspectRatio: 1,
              child: getSum() > 0
                  ? PieChart(
                      PieChartData(
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 40,
                        sections: data.keys.map(
                          (i) {
                            double percent = data[i] / total * 100;
                            return PieChartSectionData(
                              color: fixedColors[data.keys.toList().indexOf(i)],
                              value: percent,
                              title: "${percent.toStringAsFixed(1)}%",
                              titleStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.white),
                            );
                          },
                        ).toList(),
                      ),
                    )
                  : SizedBox(),
            ),
          ),
          SizedBox(height: 6),
          Wrap(
            alignment: WrapAlignment.center,
            children: data.keys.map(
              (i) {
                return ChartIndicator(
                  color: fixedColors[data.keys.toList().indexOf(i)],
                  title: i,
                  value: data[i] / 1,
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
