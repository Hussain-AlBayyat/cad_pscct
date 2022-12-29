import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pscct/models/pscct_kpi.dart';

import '../../size_config.dart';
import '../kpi.dart';
import '../loading_circular.dart';

class KpisListView extends StatelessWidget {
  KpisListView({required this.future, Key? key}) : super(key: key);
  final Future<List<PSCCTKpi>> Function() future;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PSCCTKpi>>(
        future: future(),
        builder: (context, kpis) {
          if (kpis.hasError)
            return Center(
                child: Text(
              (kpis.error as DioError).message,
              style: TextStyle(fontSize: 18, color: Colors.red),
            ));
          if (!kpis.hasData) {
            return Center(child: LoadingCircular());
          }

          return Wrap(
              spacing: getProportionateScreenWidth(26),
              runSpacing: getProportionateScreenHeight(20),
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ...List.generate(
                  kpis.data!.length,
                  (index) => KPI(kpi: kpis.data![index]),
                )
              ]);
        });
  }
}
