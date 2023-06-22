import 'package:collection/collection.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import '../dashboard/model/production_model.dart';
import 'dashboard_flip_card_back.dart';
import 'dashboard_flip_card_front.dart';
import 'fake_producttions.dart';

class DashboardFlipCard extends StatefulWidget {
  final FlipCardController controller = FlipCardController();
  final List<ProductionModel>? datas = DummyProducts.products;
  final String title;
  DashboardFlipCard({super.key, required this.title});

  @override
  State<DashboardFlipCard> createState() => _DashboardFlipCardState();
}

Map<String?, List<ProductionModel>> groupData(List<ProductionModel> datas) {
  return groupBy(
    datas,
    (ProductionModel production) => production.brand,
  );
}

class _DashboardFlipCardState extends State<DashboardFlipCard> {
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      flipOnTouch: false,
      controller: widget.controller,
      front: DashboardFlipCardFront(
          datas: widget.datas,
          loading: false,
          title: widget.title,
          controller: widget.controller),
      back: DashboardFlipCardBack(
        controller: widget.controller,
        datas: widget.datas!,
      ),
    );
  }
}
