import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphWidget extends StatelessWidget {
  final List<dynamic> xValues;
  final List<dynamic> yValues;

  final List<dynamic>? secondXValues;
  final List<dynamic>? secondYValues;

  const GraphWidget({
    super.key,
    required this.xValues,
    required this.yValues,
    this.secondXValues,
    this.secondYValues,
  });

  @override
  Widget build(BuildContext context) {
    final firstSpots = List.generate(
      xValues.length,
      (index) => FlSpot(
        (xValues[index] as num).toDouble(),
        (yValues[index] as num).toDouble(),
      ),
    );

    final List<LineChartBarData> lines = [
      LineChartBarData(
        spots: firstSpots,
        isCurved: true,
        barWidth: 4,
        color: Colors.blue,
        dotData: const FlDotData(show: true),
      ),
    ];

    if (secondXValues != null &&
        secondYValues != null) {
      final secondSpots = List.generate(
        secondXValues!.length,
        (index) => FlSpot(
          (secondXValues![index] as num)
              .toDouble(),
          (secondYValues![index] as num)
              .toDouble(),
        ),
      );

      lines.add(
        LineChartBarData(
          spots: secondSpots,
          isCurved: true,
          barWidth: 4,
          color: Colors.red,
          dotData: const FlDotData(show: true),
        ),
      );
    }

    return LineChart(
      LineChartData(
        minX: (xValues.first as num).toDouble(),
        maxX: (xValues.last as num).toDouble(),

        gridData: const FlGridData(
          show: true,
        ),

        borderData: FlBorderData(
          show: true,
        ),

        titlesData: FlTitlesData(
          show: true,

          topTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),

          rightTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),

          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 0.2,
              reservedSize: 32,
              getTitlesWidget:
                  (value, meta) {
                return Text(
                  value
                      .toStringAsFixed(1),
                );
              },
            ),
          ),
        ),

        lineBarsData: lines,
      ),
    );
  }
}