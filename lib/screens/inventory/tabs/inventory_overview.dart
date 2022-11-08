import 'package:flutter/material.dart';
import 'package:pscct/models/assets.dart';
import 'package:pscct/screens/inventory/widgets/inventory_trend.dart';
import 'package:pscct/screens/inventory/widgets/outsourced_inventory.dart';
import 'package:pscct/screens/inventory/widgets/upcoming_purchase_order.dart';

import '../../../shared-widgets/overview.dart';

class InventoryOverview extends StatelessWidget {
  InventoryOverview({Key? key}) : super(key: key);
  final titles = ["Value", "Slow Moving", "Non Moving"];

  final List<Map> widgets = [
    {
      "title": "Inventory Trend",
      "widget": InventoryTrend(),
      "icon": Assets.trendIcon,
      "description":
          "Inventory trend and the prediction of Drilling, Project, and MRO inventory level in future."
    },
    {
      "title": "Outsourced Inventory",
      "widget": OutsourcedInventory(),
      "icon": Assets.tableListIcon,
      "description": "Outsourced inventory values in suppliers’ warehouses."
    },
    {
      "title": "Upcoming Purchase Order",
      "widget": UpcomingPurchaseOrder(),
      "icon": Assets.columnChartIcon,
      "description": "Upcoming purchase orders values to Aramco warehouses."
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Overview(
      widgets: widgets,
      titles: titles,
    );
  }
}
