// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../models/sales.dart';

class CategoryProductsChart extends StatelessWidget {
  final List<Sales> data;
  const CategoryProductsChart({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SfSparkBarChart.custom(
        dataCount: data.length,
        xValueMapper: (int index) => data[index].label,
        yValueMapper: (int index) => data[index].earning,
        axisCrossesAt: 0,
        axisLineWidth: 1,
        axisLineColor: Colors.grey,
      ),
    ]);
  }
}
