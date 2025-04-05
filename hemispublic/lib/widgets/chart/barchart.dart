import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hemispublic/utils/utils.dart';
import 'package:hemispublic/widgets/chart/chart-indicator.dart';

class GroupBarChart extends StatelessWidget {
  GroupBarChart({
    super.key,
    required this.data,
    this.labelAngle = 6,
    this.isHorizontal = false,
    this.height = 300,
    this.padding = const EdgeInsets.only(right: 24),
    this.lTilesReservedSpace = 60,
    this.bTilesReservedSpace = 60,
    this.color = Colors.black,
    this.fixedColors = const [
      Colors.black,
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.yellow,
    ],
  });

  final double labelAngle;
  final bool isHorizontal;
  final double height;
  final EdgeInsets padding;
  final double lTilesReservedSpace;
  final double bTilesReservedSpace;
  final Color color;
  final List<Color> fixedColors;

  final Map<String, dynamic> data;

  double getSum() {
    double sum = 0;
    data.forEach((key, value) {
      if (value.runtimeType.toString() == "_Map<String, dynamic>") {
        value.forEach((key, value) {
          sum += value;
        });
      } else {
        sum += value;
      }
    });
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    double total = getSum();
    return Column(
      children: [
        SizedBox(height: 12),
        Padding(
          padding: padding,
          child: SizedBox(
            width: double.infinity,
            height: height,
            child: BarChart(
              BarChartData(
                rotationQuarterTurns: isHorizontal ? 1 : 0,
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    tooltipPadding: EdgeInsets.only(
                      top: 4,
                      left: 4,
                      right: 4,
                    ),
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        "${(rod.toY / total * 100).toStringAsFixed(1)}%\n${beautifyDouble(rod.toY)}",
                        Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                            ),
                      );
                    },
                    getTooltipColor: (group) {
                      return Colors.black.withAlpha(150);
                    },
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                ),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: lTilesReservedSpace,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          meta: meta,
                          space: 16,
                          child: Text(
                            formatToK(value),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (index, meta) {
                        final titles = data.keys.toList();
                        final Widget text = Text(
                          titles[index.toInt()].replaceAll(" ", "\n"),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall,
                        );
                        return SideTitleWidget(
                          angle: labelAngle,
                          meta: meta,
                          space: 16,
                          child: text,
                        );
                      },
                      reservedSize: bTilesReservedSpace,
                    ),
                  ),
                ),
                barGroups: getData(),
              ),
            ),
          ),
        ),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _getBars()
              .entries
              .map(
                (entry) => ChartIndicator(
                  color: entry.value,
                  title: entry.key,
                ),
              )
              .toList(),
        ),
        SizedBox(height: 12),
      ],
    );
  }

  Map<String, Color> _getBars() {
    Map<String, Color> barTitles = {};
    final titles = data.keys.toList();
    int startColor = 2;
    if (data[titles[0]].runtimeType.toString() == "_Map<String, dynamic>") {
      for (var element in titles) {
        for (var item in data[element].keys) {
          if (!barTitles.keys.contains(item)) {
            barTitles[item] = fixedColors[startColor];
            startColor++;
          }
        }
      }
    }
    return barTitles;
  }

  List<BarChartGroupData> getData() {
    List<BarChartGroupData> chartData = [];
    final titles = data.keys.toList();

    for (var element in titles) {
      final mapElement = data[element];
      List<BarChartRodData> rodData = [];
      print(mapElement.runtimeType.toString());
      if (mapElement.runtimeType.toString() == "_Map<String, dynamic>") {
        for (var item in data[element].keys) {
          int index = data[element].keys.toList().indexOf(item);
          rodData.add(
            BarChartRodData(
              toY: data[element][item] / 1,
              color: fixedColors[index + 2],
              width: 10,
            ),
          );
        }
      } else {
        rodData.add(
          BarChartRodData(
            toY: data[element] / 1,
            color: color,
            width: 10,
          ),
        );
      }
      chartData.add(
        BarChartGroupData(
          showingTooltipIndicators: [0, 1, 2, 3, 4],
          barsSpace: 3,
          x: titles.indexOf(element),
          barRods: rodData,
        ),
      );
    }
    return chartData;
  }
}
