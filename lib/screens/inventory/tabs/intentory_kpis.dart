import 'package:flutter/material.dart';
import 'package:pscct/size_config.dart';

import '../../../shared-widgets/kpi.dart';

class InventoryKpis extends StatelessWidget {
  const InventoryKpis({Key? key}) : super(key: key);

  static final kpis = [
    KPI(
      title: "IQR Drilling",
      subtitle: "FYP",
      value: 95,
      target: 90,
      description:
          "Inventory Quality Ratio (IQR) KPI indicates the percentage of the active materials compared to the total inventory.",
    ),
    KPI(
        title: "IQR Projects",
        subtitle: "FYP",
        value: 85,
        target: 90,
        description:
            "Inventory Quality Ratio (IQR) KPI indicates the percentage of the active materials compared to the total inventory."),
    KPI(
        title: "IQR MRO",
        subtitle: "FYP",
        value: 85,
        target: 90,
        description:
            "Inventory Quality Ratio (IQR) KPI indicates the percentage of the active materials compared to the total inventory."),
    KPI(
        title: "Projects Forecast Error",
        subtitle: "FYP",
        value: 95,
        target: 90,
        description:
            "Forecast Error KPI measures the absolute value of difference between forecasted numbers and actual consumption. The figure is calculated as a percentage."),
    KPI(
        title: "Drilling Forecast Error",
        subtitle: "FYP",
        value: 95,
        target: 90,
        description:
            "Forecast Error KPI measures the absolute value of difference between forecasted numbers and actual consumption. The figure is calculated as a percentage."),
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
