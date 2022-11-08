import 'package:flutter/material.dart';

import '../../../shared-widgets/bar_percentage.dart';

class Materials extends StatelessWidget {
  Materials({Key? key}) : super(key: key);
  static const List<Map> materialsData = [
    {"title": "Drilling", "amount": 21, "percentage": 58},
    {"title": "Chemicals", "amount": 64, "percentage": 53},
    {"title": "Pipes", "amount": 23, "percentage": 74},
    {"title": "Vessels", "amount": 16, "percentage": 36},
    {"title": "Valves", "amount": 35, "percentage": 31},
    {"title": "Electrical", "amount": 41, "percentage": 31},
    {"title": "Instrumentation", "amount": 34, "percentage": 21},
  ];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...List.generate(
        materialsData.length,
        (index) => SpendItem(
            title: materialsData[index]["title"],
            amount: materialsData[index]["amount"],
            percentage: materialsData[index]["percentage"]),
      ),
    ]);
  }
}
