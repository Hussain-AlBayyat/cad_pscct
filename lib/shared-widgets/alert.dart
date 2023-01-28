import 'package:flutter/material.dart';
import 'package:pscct/models/assets.dart';
import 'package:pscct/models/dialog_controller.dart';
import 'package:pscct/models/pscct_alert.dart';
import 'package:pscct/shared-widgets/loading_circular.dart';
import 'package:pscct/size_config.dart';

import '../helper.dart';
import '../models/enums/echart_configurator.dart';
import '../repositories/procurement_repository.dart';
import 'echarts/echart.dart';

class Alert extends StatelessWidget {
  Alert({required this.pscctAlert, Key? key}) : super(key: key);
  final PSCCTAlert pscctAlert;
  late final Color statusColor;
  final ProcurementRepository procurementRepository = ProcurementRepository();

  @override
  Widget build(BuildContext context) {
    if (pscctAlert.Criticality == "C") {
      statusColor = Color(0xFFDC3C3C);
    } else if (pscctAlert.Criticality == "W") {
      statusColor = Color(0xFFF8CB0B);
    } else {
      statusColor = Color(0xFF84BD00);
    }
    // print(pscctAlert.DataSourceNav["results"][0]!["TechnicalName"]);
    return InkWell(
      onTap: () => DialogController.showPopup(
        pscctAlert.Title,
        pscctAlert.Description,
        dialogBody: (pscctAlert.DataSourceNav["results"] as List).isEmpty
            ? Container()
            : FutureBuilder<List<Map>>(
                future: procurementRepository.getAlertTrend(
                    pscctAlert.DataSourceNav["results"][0]!["TechnicalName"]),
                builder: (context, data) {
                  if (data.hasError)
                    return Center(
                        child: Text(
                      data.error.toString(),
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ));
                  if (!data.hasData) {
                    return LoadingCircular();
                  }

                  return EChartCharts(
                    data: data.data!,
                    name: pscctAlert.Title,
                    configurations: [
                      EChartConfigurator(chartType: ChartType.line),
                    ],
                  );
                }),
        context,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Row(
          children: [
            Image.asset(Assets.alertIcon,
                height: getProportionateScreenHeight(26), color: statusColor),
            SizedBox(
              width: getProportionateScreenWidth(16),
            ),
            Expanded(
              child: Text(
                pscctAlert.Title,
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).highlightColor,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  "${Helper.compactNumber(pscctAlert.Value)}",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).highlightColor,
                      fontSize: 20),
                ),
                /*    Container(
                    width: getProportionateScreenWidth(33),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: statusColor),
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    child: Text(
                      "${pscctAlert.Value}",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ))*/
              ],
            ),
            SizedBox(
              width: getProportionateScreenWidth(16),
            ),
            Image.asset(
              Assets.moreInfoIcon,
              height: getProportionateScreenHeight(20),
            ),
          ],
        ),
      ),
    );
  }
}
