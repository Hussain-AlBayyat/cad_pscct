import 'package:flutter/material.dart';

import 'package:pscct/screens/warehouse/tabs/wh_logistics_alerts.dart';
import 'package:pscct/screens/warehouse/tabs/wh_logistics_kpis.dart';
import 'package:pscct/screens/warehouse/tabs/wh_logistics_overview.dart';

import '../../shared-widgets/custom_tabs.dart';

class WarehouseScreen extends StatelessWidget {
  WarehouseScreen({Key? key}) : super(key: key);
  final List<Widget> tabPages = [
    WarehouseLogisticsOverview(),
    WarehouseLogisticsKpis(),
    WarehouseLogisticsAlerts(),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomTabs(
      tabPages: tabPages,
    );
  }
}
