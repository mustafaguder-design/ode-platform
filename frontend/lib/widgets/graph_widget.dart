import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphWidget extends StatelessWidget {
  final List<dynamic> xValues;
  final List<dynamic> yValues;

  const GraphWidget({
    super.key,
    required this.xValues,
    required this.yValues,
  });

  @override
  Widget build(BuildContext context) {
    final spots = List.generate(
      xValues.length,
      (index) => FlSpot(
        (xValues[index] as num).toDouble(),
        (yValues[index] as num).toDouble(),
      ),
    );

    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: true),
        borderData: FlBorderData(show: true),
        titlesData: const FlTitlesData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            barWidth: 4,
            dotData: const FlDotData(show: true),
          ),
        ],
      ),
    );
  }
}