import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pscct/models/pscct_alert.dart';
import 'package:pscct/shared-widgets/alert.dart';

import '../loading_circular.dart';

class AlertsListView extends StatelessWidget {
  AlertsListView({required this.future, Key? key}) : super(key: key);
  final Future<List<PSCCTAlert>> Function() future;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PSCCTAlert>>(
        future: future(),
        builder: (context, alerts) {
          if (alerts.hasError)
            return Center(
                child: Text(
              (alerts.error as DioError).message,
              style: TextStyle(fontSize: 18, color: Colors.red),
            ));
          if (!alerts.hasData) {
            return Center(child: LoadingCircular());
          }

          return ListView.separated(
            padding: EdgeInsets.all(0),
            itemCount: alerts.data!.length, //alerts.length,
            primary: false,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(color: Colors.grey, height: 1),
            itemBuilder: (BuildContext context, int index) {
              return Alert(pscctAlert: alerts.data![index]);
            },
          );
        });
  }
}
