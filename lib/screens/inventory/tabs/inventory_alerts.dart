import 'package:flutter/material.dart';
import 'package:pscct/repositories/inventory_repository.dart';

import '../../../shared-widgets/lists/alerts_list_view.dart';

class InventoryAlerts extends StatelessWidget {
  InventoryAlerts({Key? key}) : super(key: key);

  final InventoryRepository inventoryRepository = InventoryRepository();

  @override
  Widget build(BuildContext context) {
    return AlertsListView(future: inventoryRepository.getInventoryAlerts);
  }
}
