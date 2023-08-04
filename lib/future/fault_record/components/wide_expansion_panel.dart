import 'package:flutter/material.dart';

ExpansionPanel wideExpansionPanel(
    {required Widget body,
    bool isExpanded = false,
    List<Widget>? header,
    List<Widget>? subHeader}) {
  header = [
    ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
        onPressed: () {},
        child: const Text('Stokta', style: TextStyle(color: Colors.white))),
    const Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Grup Kodu',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Text('20203896')
        ],
      ),
    ),
    const Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Sipariş Adedi', style: TextStyle(fontWeight: FontWeight.w600)),
          Text('500000000')
        ],
      ),
    ),
  ];

  subHeader = [
    const Column(
      children: [
        Text(
          'Üretimde',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Text('20203896')
      ],
    ),
    const Column(
      children: [
        Text(
          'Stokta',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Text('20203896')
      ],
    ),
    const Column(
      children: [
        Text(
          'Toplam',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Text('20203896')
      ],
    ),
  ];

  return ExpansionPanel(
      canTapOnHeader: true,
      isExpanded: isExpanded,
      headerBuilder: (context, isExpanded) {
        return const Padding(
          padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceEvenly,
            direction: Axis.horizontal,
            spacing: 18.0,
          ),
        );
      },
      body: body);
}
