import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../models/pscct_report.dart';
import '../loading_circular.dart';
import '../overview.dart';

class ReportsListView extends StatelessWidget {
  ReportsListView({required this.future, Key? key}) : super(key: key);
  final Future<List<PSCCTReport>> Function() future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PSCCTReport>>(
        future: future(),
        builder: (context, reports) {
          if (reports.hasError)
            return Center(
                child: Text(
              (reports.error as DioError).response?.statusMessage ?? "Error!",
              style: TextStyle(fontSize: 18, color: Colors.red),
            ));
          if (!reports.hasData) {
            return Center(child: LoadingCircular());
          }

          return Overview(reports: reports.data!);
        });
  }
}
