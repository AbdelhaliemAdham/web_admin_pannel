import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        centerSpaceRadius: 70,
        sections: [
          PieChartSectionData(
            showTitle: false,
            color: const Color(0xff0097FF),
            value: 15,
            radius: 20,
          ),
          PieChartSectionData(
            showTitle: false,
            color: const Color(0xff00E9FF),
            value: 10,
            radius: 18,
          ),
          PieChartSectionData(
            showTitle: false,
            color: Colors.red,
            value: 10,
            radius: 15,
          ),
          PieChartSectionData(
            showTitle: false,
            color: const Color(0xffFFCE00),
            value: 10,
            radius: 17,
          ),
          PieChartSectionData(
            showTitle: false,
            color: const Color(0xff263753),
            value: 13,
            radius: 12,
          ),
        ],
      ),
    );
  }
}