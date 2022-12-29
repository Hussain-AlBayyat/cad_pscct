import 'package:flutter/material.dart';
import 'package:pscct/helper.dart';

class LowValueProcurement extends StatelessWidget {
  LowValueProcurement({required this.data, Key? key}) : super(key: key);
  final lowValueProcurementData = [
    {"label": "PO (L/I) Released", "value": "771"},
    {"label": "Man Hours Saved", "value": "27.2K"},
    {"label": "Money Saved", "value": "\$1MM"}
  ];
  final List<Map> data;

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
                        (lowValueProcurementData[index]["label"])!,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        Helper.compactNumber(
                            data.first.values.toList()[index + 1]),
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                ))
      ],
    );
  }
}
