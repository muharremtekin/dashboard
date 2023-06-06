import 'dart:js_interop';

import 'package:flutter/material.dart';

import '../../../product/sizes_enum.dart';
import 'build_line_chart.dart';
import 'custom_text.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    Key? key,
    required this.title,
    required this.value,
    required this.isaHaveChartData,
    required this.isLeanLeft,
    this.valueFontSize = 60,
    this.subtitle,
  }) : super(key: key);
  final String title;
  final String value;
  final bool isaHaveChartData;
  final bool isLeanLeft;
  final double valueFontSize;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Sizes.size16.size),
      child: Container(
        width: isLeanLeft ? double.infinity : null,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size16.size),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(Sizes.size16.size),
          child: Column(
            crossAxisAlignment: isLeanLeft
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Başlık alanı
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: FittedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomText(
                              title: title,
                              fontSize: Sizes.size30.size,
                            ),
                            if (!subtitle.isNull)
                              CustomText(
                                title: subtitle!,
                                fontSize: Sizes.size20.size,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Değer alanı
              Expanded(
                flex: 3,
                child: FittedBox(
                    child: CustomText(title: value, fontSize: valueFontSize)),
              ),
              // Grafik alanı
              if (isaHaveChartData)
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: isLeanLeft ? double.infinity : null,
                    child: const BuildLineChart(),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
