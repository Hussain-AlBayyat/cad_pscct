import 'package:flutter/material.dart';

import '../../../shared-widgets/bar_percentage.dart';

class SpendByCountry extends StatelessWidget {
  SpendByCountry({Key? key}) : super(key: key);
  static const List<Map> spendByCountryData = [
    {"title": "Saudi Arabia", "amount": 21, "percentage": 58},
    {"title": "USA", "amount": 64, "percentage": 53},
    {"title": "Italy", "amount": 23, "percentage": 74},
    {"title": "China", "amount": 16, "percentage": 36},
    {"title": "Singapore", "amount": 35, "percentage": 31},
    {"title": "Unite Arab Emirates", "amount": 41, "percentage": 31},
    {"title": "India", "amount": 34, "percentage": 21},
    {"title": "Oman", "amount": 34, "percentage": 21},
    {"title": "Kuwait", "amount": 34, "percentage": 21},
  ];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...List.generate(
        spendByCountryData.length,
        (index) => SpendItem(
            title: spendByCountryData[index]["title"],
            amount: spendByCountryData[index]["amount"],
            percentage: spendByCountryData[index]["percentage"]),
      ),
    ]);
  }
}
