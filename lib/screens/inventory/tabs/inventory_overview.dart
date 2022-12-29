import 'package:flutter/material.dart';
import 'package:pscct/models/assets.dart';
import 'package:pscct/repositories/inventory_repository.dart';
import 'package:pscct/screens/inventory/widgets/inventory_trend.dart';
import 'package:pscct/screens/inventory/widgets/outsourced_inventory.dart';
import 'package:pscct/screens/inventory/widgets/upcoming_purchase_order.dart';

import '../../../shared-widgets/lists/reports_list_view.dart';
import '../../../shared-widgets/overview.dart';

class InventoryOverview extends StatelessWidget {
  InventoryOverview({Key? key}) : super(key: key);
  final titles = ["Value", "Slow Moving", "Non Moving"];

  final InventoryRepository inventoryRepository = InventoryRepository();
  @override
  Widget build(BuildContext context) {
    return ReportsListView(future: inventoryRepository.getInventoryReports);
  }
}
