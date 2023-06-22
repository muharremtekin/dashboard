import 'dart:js_interop';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_dashboard/core/extensions/context_extensions.dart';
import 'package:new_dashboard/future/dashboard/components/custom_header_text.dart';
import 'package:new_dashboard/future/dashboard/model/production_model.dart';
import '../dashboard/components/line_chart_example.dart';

class DashboardFlipCardFront extends StatefulWidget {
  final List<ProductionModel>? datas;
  final bool? loading;
  final String title;
  final FlipCardController controller;

  const DashboardFlipCardFront({
    Key? key,
    required this.title,
    required this.datas,
    required this.loading,
    required this.controller,
  }) : super(key: key);

  @override
  State<DashboardFlipCardFront> createState() => _DashboardFlipCardFrontState();
}

class _DashboardFlipCardFrontState extends State<DashboardFlipCardFront> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: context.lowValue, bottom: context.lowValue),
      child: Container(
        color: context.colors.background,
        child: widget.loading!
            ? const Center(child: CircularProgressIndicator())
            : widget.datas.isNull
                ? Center(
                    child: Text(
                      'Veri bulunamadı.',
                      style: TextStyle(color: context.colors.error),
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Başlık alanı
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: context.normalValue),
                                child: CustomHeaderText(
                                  title: widget.title,
                                  fontSize: 15,
                                ),
                              ),
                              // Döndürme butonu
                              IconButton(
                                onPressed: () => widget.controller.toggleCard(),
                                icon: const Icon(Icons.remove_red_eye),
                              )
                            ],
                          ),
                        ),

                        // Değer alanı
                        Expanded(
                          flex: 4,
                          child: Center(
                            child: Text(
                              widget.datas!.length.toString(),
                              style: const TextStyle(
                                  fontSize: 80,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            ),
                          ),
                        ),

                        // Grafik alanı
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: context.paddingLow,
                            child: LineChartSample2(datas: widget.datas),
                          ),
                        )
                      ],
                    ),
                  ),
      ),
    );
  }
}
