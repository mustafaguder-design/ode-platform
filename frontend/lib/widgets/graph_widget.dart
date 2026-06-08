import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphWidget extends StatelessWidget {
  const GraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: true),

        titlesData: const FlTitlesData(
          show: true,
        ),

        borderData: FlBorderData(
          show: true,
        ),

        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 1),
              FlSpot(1, 2),
              FlSpot(2, 3),
              FlSpot(3, 4),
              FlSpot(4, 4.5),
            ],
            isCurved: true,
            barWidth: 4,
            dotData: const FlDotData(show: true),
          ),

          LineChartBarData(
            spots: const [
              FlSpot(0, 1),
              FlSpot(1, 1.8),
              FlSpot(2, 2.9),
              FlSpot(3, 4.2),
              FlSpot(4, 5),
            ],
            isCurved: true,
            barWidth: 4,
            dotData: const FlDotData(show: true),
          ),
        ],
      ),
    );
  }
}