import 'package:flutter/material.dart';

import '../../../shared-widgets/kpi.dart';
import '../../../size_config.dart';

class WarehouseLogisticsKpis extends StatelessWidget {
  const WarehouseLogisticsKpis({Key? key}) : super(key: key);
  static final kpis = [
    KPI(
      title: "Warehouse OTD",
      subtitle: "FYP",
      value: 95,
      target: 90,
      description:
          "Warehouse On-Time Delivery KPI is calculated from the Transfer Order (TO) to the Internal Manifest (IM).",
    ),
    KPI(
      title: "Logistics OTD",
      subtitle: "FYP",
      value: 85,
      target: 90,
      description:
          "Logistics On-Time Delivery KPI is Calculated from the Advanced Shipment Notice (ASN) to the Proof Of Delivery (POD), or from the Proof of Collection (POC) to the Proof Of Delivery (POD).",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: getProportionateScreenWidth(20),
      runSpacing: getProportionateScreenHeight(20),
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        ...List.generate(
          kpis.length,
          (index) => KPI(
              title: kpis[index].title,
              subtitle: "FYP",
              description: kpis[index].description,
              value: kpis[index].value,
              target: kpis[index].target),
        ),
      ],
    );
  }
}
