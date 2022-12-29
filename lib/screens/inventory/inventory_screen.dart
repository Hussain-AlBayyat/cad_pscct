import 'package:flutter/material.dart';

import 'package:pscct/screens/inventory/tabs/inventory_alerts.dart';

import '../../shared-widgets/custom_tabs.dart';
import 'tabs/intentory_kpis.dart';
import 'tabs/inventory_overview.dart';

class InventoryScreen extends StatefulWidget {
  InventoryScreen({Key? key}) : super(key: key);

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  List<Widget> tabPages = [
    InventoryOverview(),
    InventoryKpis(),
    InventoryAlerts(),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomTabs(
      tabPages: tabPages,
    );
  }
}
