import 'package:flutter/material.dart';

enum ProductColors {
  cnc(0xff52D726),
  pres(0xffFFEC00),
  baski(0xffFF7300),
  tornalama(0xffFF0000),
  extruder(0xff007ED6),
  def(0xff7CDDDD);

  final int value;
  const ProductColors(this.value);
}

Color getProductColor({required String brandName}) {
  switch (brandName.toLowerCase()) {
    case 'cnc':
      return Color(ProductColors.cnc.value);
    case 'pres':
      return Color(ProductColors.pres.value);
    case 'baskı':
      return Color(ProductColors.baski.value);
    case 'tornalama':
      return Color(ProductColors.tornalama.value);
    case 'extruder':
      return Color(ProductColors.extruder.value);
    default:
      return Color(ProductColors.def.value);
  }
}
