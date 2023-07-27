// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_dashboard/core/extensions/context_extensions.dart';
import 'package:new_dashboard/future/dashboard/components/dashboard_pie_chart.dart';
import 'package:new_dashboard/future/dashboard/model/production_model.dart';
import 'package:new_dashboard/core/enums/product_colors_enum.dart';
import '../dashboard/components/custom_header_text.dart';

class DashboardFlipCardBack extends StatelessWidget {
  final FlipCardController controller;
  final List<ProductionModel> datas;
  
  const DashboardFlipCardBack(
      {super.key, required this.controller, required this.datas});

  Map<String?, List<ProductionModel>> groupByBrand(
      List<ProductionModel> datas) {
    return groupBy(
      datas,
      (ProductionModel production) => production.brand,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String?, List<ProductionModel>> groupedByBrandDatas =
        groupByBrand(datas);

    return Padding(
      padding:
          EdgeInsets.only(left: context.lowValue, bottom: context.lowValue),
      child: Container(
        color: context.colors.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: _buildCardHeader(context),
            ),
            Expanded(
              flex: 5,
              child: _buildCardBody(groupedByBrandDatas),
            )
          ],
        ),
      ),
    );
  }

  Row _buildCardBody(Map<String?, List<ProductionModel>> groupedDatas) {
    return Row(
      children: [
        DashboardPieChart(
          datas: groupedDatas,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              endIndent: 10,
            ),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: groupedDatas.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: context.lowValue),
                    child: Container(
                      height: 10,
                      width: 20,
                      color: getProductColor(
                          brandName: groupedDatas.keys.toList()[index]!),
                    ),
                  ),
                  Text(
                    '${index + 1} - ${groupedDatas.keys.toList()[index]!}',
                    style: TextStyle(
                      color: context.colors.onBackground,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }

  Row _buildCardHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: context.normalValue),
          child: const CustomHeaderText(
            title: 'Üretim',
            fontSize: 15,
          ),
        ),
        // Döndürme butonu
        IconButton(
          onPressed: () => controller.toggleCard(),
          icon: const Icon(Icons.remove_red_eye),
        )
      ],
    );
  }
}
