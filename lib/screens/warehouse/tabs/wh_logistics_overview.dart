import 'package:flutter/material.dart';
import 'package:pscct/screens/warehouse/widgets/co2_emission_target2.dart';
import 'package:pscct/screens/warehouse/widgets/pending_goods_receipt.dart';

import '../../../models/assets.dart';
import '../../../shared-widgets/overview.dart';
import '../widgets/shipping_price_index.dart';

class WarehouseLogisticsOverview extends StatelessWidget {
  WarehouseLogisticsOverview({Key? key}) : super(key: key);

  final List<Map> widgets = [
    {
      "title": "Shipping Price Index",
      "widget": ShippingPriceIndex(),
      "icon": Assets.trendIcon,
      "description":
          "This chart shows the global container price per quarter since 2019. It is based on Freightos Baltic Index (FBX)."
    },
    {
      "title": "Pending Goods Receipt",
      "widget": PendingGoodsReceipt(),
      "icon": Assets.columnChartIcon,
      "description":
          "This chart shows line items received at warehouses that are still under procession without Goods Receipt (GR) posted. Breakdows is by division at Materials Service Department (MSD)."
    },
    {
      "title": "CO2 Emission Targets",
      "widget": CO2EmissionTargets(),
      "icon": Assets.trendIcon,
      "description":
          "This chart shows line items received at warehouses that are still under procession without Goods Receipt (GR) posted. Breakdows is by division at Materials Service Department (MSD)."
    },
  ];
  final titles = ["Lorum Ipsum", "Lorum Ipsum", "Lorum Ipsum"];

  final List<List<Map<String, dynamic>>> convertedData = [];
  @override
  Widget build(BuildContext context) {
    return Overview(
      widgets: widgets,
      titles: titles,
    );
  }
}
