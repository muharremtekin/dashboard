import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:new_dashboard/future/dashboard/build_line_chart.dart';

import '../../product/sizes_enum.dart';
import 'custom_text.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    Key? key,
    required this.title,
    required this.value,
    required this.isaHaveChartData,
    required this.isLeanLeft,
    required this.valueFontSize,
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
                      child: Container(
                        color: Colors.blue,
                        child: FittedBox(
                          alignment: Alignment.bottomCenter,
                          child: CustomText(
                            title: title,
                          ),
                        ),
                      ),
                    ),
                    // Alt başlık boş değilse göster
                    if (!subtitle.isNull)
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.red,
                          child: CustomText(title: subtitle!),
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
