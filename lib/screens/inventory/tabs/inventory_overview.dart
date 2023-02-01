import 'package:flutter/material.dart';
import 'package:pscct/repositories/inventory_repository.dart';

import '../../../shared-widgets/lists/reports_list_view.dart';

class InventoryOverview extends StatelessWidget {
  InventoryOverview({Key? key}) : super(key: key);
  final titles = ["Value", "Slow Moving", "Non Moving"];

  final InventoryRepository inventoryRepository = InventoryRepository();
  @override
  Widget build(BuildContext context) {
    return ReportsListView(future: inventoryRepository.getInventoryReports);
  }
}
