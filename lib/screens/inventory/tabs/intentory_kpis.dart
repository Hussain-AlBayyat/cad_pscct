import 'package:flutter/material.dart';
import 'package:pscct/repositories/inventory_repository.dart';

import '../../../shared-widgets/lists/kpis_list_view.dart';

class InventoryKpis extends StatelessWidget {
  InventoryKpis({Key? key}) : super(key: key);

  final InventoryRepository inventoryRepository = InventoryRepository();

  @override
  Widget build(BuildContext context) {
    return KpisListView(
      future: inventoryRepository.getInventoryKpis,
    );
  }
}
