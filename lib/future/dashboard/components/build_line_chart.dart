import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BuildLineChart extends StatefulWidget {
  const BuildLineChart({super.key});

  @override
  State<BuildLineChart> createState() => _BuildLineChartState();
}

class _BuildLineChartState extends State<BuildLineChart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5,
      child: LineChart(
        LineChartData(
          borderData: FlBorderData(
            show: false,
          ),
          gridData: FlGridData(
            show: false,
          ),
          titlesData: FlTitlesData(
            show: false,
          ),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 3),
                FlSpot(2.6, 2),
                FlSpot(4.9, 5),
                FlSpot(6.8, 3.1),
                FlSpot(8, 4),
                FlSpot(9.5, 3),
                FlSpot(11, 4),
              ],
              color: Colors.green,
              isCurved: true,
              barWidth: 4,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                color: Colors.green.withOpacity(0.3),
                show: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
