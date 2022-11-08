import 'package:flutter/material.dart';

import '../../../shared-widgets/kpi.dart';
import '../../../size_config.dart';

class ProcurementKpis extends StatelessWidget {
  const ProcurementKpis({Key? key}) : super(key: key);
  static final kpis = [
    KPI(
      title: "Buyer OTD",
      subtitle: "FYP",
      value: 95,
      target: 90,
      description:
          "Buyer On-Time Delivery KPI is calculated from the date the Purchase Requisition (PR) is released to Purchasing until the Purchase Order (PO) is issued to the supplier.",
    ),
    KPI(
      title: "Supplier OTD",
      subtitle: "FYP",
      value: 85,
      target: 90,
      description:
          "Supplier On-Time Delivery KPI is calculated from the Statistical Delivery Date (SDD) to either Advanced Shipment Notice (ASN), Goods Collection Confirmation (GCC) or Goods Receipt (GR).",
    ),
    KPI(
      title: "Project Contracts Procurement Time",
      subtitle: "FYP",
      value: 85,
      target: 90,
      description:
          "Project Contracts Procurement Time KPI is calculated from the approval of Purchase Requisition Supplement (PRS) by Contract Signatory until the contract ready for award date for contracts procured by CD Projects Division.",
    ),
    KPI(
      title: "Operation Contracts Procurement Time",
      subtitle: "FYP",
      value: 95,
      target: 90,
      description:
          "Operation Contracts Procurement Time KPI is calculated from the approval of Purchase Requisition Supplement (PRS) by Contract Signatory until the contract ready for award date for contracts procured by CD Operations Division.",
    ),
    KPI(
      title: "Spend Under Management",
      subtitle: "FYP",
      value: 95,
      target: 90,
      description:
          "Spend Under Management KPI measures the levels of procurement spend that is actively managed under agreements.",
    ),
    KPI(
      title: "IKTVA Score",
      subtitle: "FYP",
      value: 95,
      target: 90,
      description:
          "IKTVA Score KPI measures the In-Kingdom Total Value Add (IKTVA) contribution generated by targeted corporate spend with suppliers for materials and services.",
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
          )
        ]);
  }
}
