import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:new_dashboard/core/enums/product_colors_enum.dart';

import '../model/production_model.dart';

class DashboardPieChart extends StatefulWidget {
  final Map<String?, List<ProductionModel>> datas;
  const DashboardPieChart({super.key, required this.datas});

  @override
  State<StatefulWidget> createState() => DashboardPieChartState();
}

class DashboardPieChartState extends State<DashboardPieChart> {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.93,
      child: PieChart(
        mainData(),
      ),
    );
  }

  PieChartData mainData() {
    return PieChartData(
      pieTouchData: PieTouchData(
        touchCallback: (FlTouchEvent event, pieTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                pieTouchResponse == null ||
                pieTouchResponse.touchedSection == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
          });
        },
      ),
      borderData: FlBorderData(
        show: false,
      ),
      sectionsSpace: 0,
      centerSpaceRadius: 0,
      sections: generateSection(),
    );
  }

  List<PieChartSectionData> generateSection() {
    final List<PieChartSectionData> sections = [];

    // ignore: unused_local_variable

    widget.datas.forEach(
      (key, value) {
        sections.add(
          PieChartSectionData(
            color: getProductColor(brandName: key!),
            value: value.length.toDouble() * 10,
            title: '${value.length}',
            radius: MediaQuery.of(context).size.height / 6,
            titleStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
              shadows: [Shadow(color: Colors.black, blurRadius: 2)],
            ),
          ),
        );
      },
    );
    return sections;
  }


// class _Badge extends StatelessWidget {
//   const _Badge(
//     this.svgAsset, {
//     required this.size,
//     required this.borderColor,
//   });
//   final String svgAsset;
//   final double size;
//   final Color borderColor;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: PieChart.defaultDuration,
//       width: size,
//       height: size,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         shape: BoxShape.circle,
//         border: Border.all(
//           color: borderColor,
//           width: 2,
//         ),
//         boxShadow: <BoxShadow>[
//           BoxShadow(
//             color: Colors.black.withOpacity(.5),
//             offset: const Offset(3, 3),
//             blurRadius: 3,
//           ),
//         ],
//       ),
//       padding: EdgeInsets.all(size * .15),
//       child: const Center(
//         child: Icon(Icons.ac_unit),
//         // SvgPicture.asset(
//         //   svgAsset,
//         // ),
//       ),
//     );
//   }
}
