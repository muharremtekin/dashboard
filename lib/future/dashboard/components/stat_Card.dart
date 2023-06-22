import 'dart:js_interop';

import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

import '../../../product/sizes_enum.dart';
import 'build_line_chart.dart';
import 'custom_text.dart';

class StatCard extends StatelessWidget {
  StatCard({
    Key? key,
    required this.title,
    required this.value,
    this.valueFontSize = 60,
    this.subtitle,
  }) : super(key: key);
  final String title;
  final String value;
  final double valueFontSize;
  final String? subtitle;
  final FlipCardController controller = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Sizes.size8.size,
        left: Sizes.size8.size,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Başlık alanı
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: title,
                  fontSize: Sizes.size30.size,
                ),
                IconButton.filledTonal(
                    onPressed: () {}, icon: const Icon(Icons.remove_red_eye))
              ],
            ),
            if (!subtitle.isNull)
              CustomText(
                title: subtitle!,
                fontSize: Sizes.size20.size,
              ),
            // Değer alanı
            Expanded(
              flex: 3,
              child: FittedBox(
                  child: CustomText(title: value, fontSize: valueFontSize)),
            ),
            // Grafik alanı

            const Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                child: BuildLineChart(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
