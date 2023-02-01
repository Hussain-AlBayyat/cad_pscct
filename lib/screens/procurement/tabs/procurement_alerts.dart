import 'package:flutter/material.dart';

import '../../../repositories/procurement_repository.dart';
import '../../../shared-widgets/lists/alerts_list_view.dart';

class ProcurementAlerts extends StatelessWidget {
  ProcurementAlerts({Key? key}) : super(key: key);

  final ProcurementRepository procurementRepository = ProcurementRepository();

  @override
  Widget build(BuildContext context) {
    return AlertsListView(future: procurementRepository.getProcurementAlerts);
  }
}
