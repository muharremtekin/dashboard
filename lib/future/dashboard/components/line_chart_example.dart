import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:new_dashboard/core/extensions/context_extensions.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import '../model/production_model.dart';

class LineChartSample2 extends StatefulWidget {
  final List<ProductionModel>? datas;
  final int? diffDay;

  const LineChartSample2({super.key, required this.datas, this.diffDay});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5,
      child: LineChart(
        mainData(),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w100,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Container(
        color: context.randomColor,
        child: text,
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w100,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1';
        break;
      case 3:
        text = '3';
        break;
      case 5:
        text = '5';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  List<Color>? gradientColors;

  LineChartData mainData() {
    gradientColors = [
      context.colors.primary,
      const Color.fromARGB(255, 0, 212, 166),
      Colors.cyan
    ];

    Map<DateTime, List<ProductionModel>> groupedProduction = groupBy(
      widget.datas!,
      (ProductionModel production) => production.orderDate!,
    );

    final List<FlSpot> flSpotList = [];

    int index = 0;

    groupedProduction.forEach((key, value) {
      flSpotList.add(FlSpot(index.toDouble(), value.length.toDouble()));
      index++;
    });

    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.grey,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.grey,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 0,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: flSpotList,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors!,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors!
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
      lineTouchData: LineTouchData(
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((spotIndex) {
            return TouchedSpotIndicatorData(
              FlLine(
                strokeWidth: 2,
                color: context.colors.primary,
              ),
              FlDotData(
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 4,
                    color: Colors.white,
                    strokeWidth: 4,
                    strokeColor: context.colors.primary,
                  );
                },
              ),
            );
          }).toList();
        },
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            return touchedBarSpots.map((barSpot) {
              final date = DateFormat('yyyy.MM.dd').format(
                groupedProduction.keys.toList()[barSpot.x.toInt()],
              );

              return LineTooltipItem(
                '$date \n',
                const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: '${barSpot.y.toString()}.Ad',
                    style: const TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              );
            }).toList();
          },
        ),
        // touchCallback: (FlTouchEvent event, LineTouchResponse? lineTouch) {
        //   if (!event.isInterestedForInteractions ||
        //       lineTouch == null ||
        //       lineTouch.lineBarSpots == null) {
        //     setState(() {
        //       // touchedValue = -1;
        //     });
        //     return;
        //   }
        //   final value = lineTouch.lineBarSpots![0].x;

        //   if (value == 0 || value == 6) {
        //     setState(() {
        //       // touchedValue = -1;
        //     });
        //     return;
        //   }

        //   setState(() {
        //     // touchedValue = value;
        //   });
        // },
      ),
    );
  }
}
