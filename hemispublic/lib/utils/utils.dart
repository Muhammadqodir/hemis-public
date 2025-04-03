

import 'package:flutter/cupertino.dart';

double getWidthPercent(BuildContext context, int percent) {
  return MediaQuery.of(context).size.width * (percent / 100);
}

double getHeightPercent(BuildContext context, int percent) {
  return MediaQuery.of(context).size.height * (percent / 100);
}