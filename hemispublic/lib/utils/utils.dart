import 'package:flutter/cupertino.dart';

double getWidthPercent(BuildContext context, int percent) {
  return MediaQuery.of(context).size.width * (percent / 100);
}

double getHeightPercent(BuildContext context, int percent) {
  return MediaQuery.of(context).size.height * (percent / 100);
}

String formatToK(double value) {
  if (value >= 1000000) {
    return '${(value / 1000000).toStringAsFixed(0)}M';
  } else if (value >= 1000) {
    return '${(value / 1000).toStringAsFixed(0)}K';
  } else {
    return value.toStringAsFixed(0);
  }
}

String beautifyDouble(double value) {
  return value.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]} ');
}

Map<String, Map<String, dynamic>> normalizeMap(Map<String, dynamic> input) {
  Map<String, Map<String, dynamic>> result = {};
  input.forEach((key, value) {
    if (value is Map<String, dynamic>) {
      for (var child in value.keys) {
        if (result.containsKey(child)) {
          result[child]!.addAll({key: value[child]});
        } else {
          result[child] = {key: value[child]};
        }
      }
    }
  });

  return result;
}

double getMapValSumm(Map<String, dynamic> data) {
  double sum = 0;
  data.forEach((key, value) {
    sum += value;
  });
  return sum;
}

Map<String, dynamic> getSubMapValSumm(
  Map<String, dynamic> data,
) {
  Map<String, double> result = {};
  data.forEach((key, value) {
    result[key] = getMapValSumm(value);
  });
  return result;
}

Map<String, dynamic> getSubListValSumm(
  List<dynamic> data,
) {
  Map<String, double> result = {};
  for (var element in data) {
    result[element['name']] = element['count'] / 1;
  }
  return result;
}
