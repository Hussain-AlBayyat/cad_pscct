import 'package:flutter/material.dart';

import '../../../shared-widgets/bar_percentage.dart';

class Materials extends StatelessWidget {
  Materials({required this.data, Key? key}) : super(key: key);
  final List<Map> data;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...List.generate(
        data.length,
        (index) => SpendItem(
          title: data[index].values.first,
          amount: data[index].values.last,
        ),
      ),
    ]);
  }
}
