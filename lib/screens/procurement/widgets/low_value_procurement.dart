import 'package:flutter/material.dart';

class LowValueProcurement extends StatelessWidget {
  LowValueProcurement({Key? key}) : super(key: key);
  final lowValueProcurementData = [
    {"label": "PO (L/I) Released", "value": "771"},
    {"label": "Man Hours Saved", "value": "27.2K"},
    {"label": "Money Saved", "value": "\$1MM"}
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
            lowValueProcurementData.length,
            (index) => Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        lowValueProcurementData[index]["label"]!,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        lowValueProcurementData[index]["value"]!,
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                ))
      ],
    );
  }
}
