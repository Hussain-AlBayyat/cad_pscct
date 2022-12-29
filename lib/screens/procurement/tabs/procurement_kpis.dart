import 'package:flutter/material.dart';

import '../../../repositories/procurement_repository.dart';
import '../../../shared-widgets/kpi.dart';
import '../../../shared-widgets/lists/kpis_list_view.dart';
import '../../../size_config.dart';

class ProcurementKpis extends StatelessWidget {
  ProcurementKpis({Key? key}) : super(key: key);
  final ProcurementRepository procurementRepository = ProcurementRepository();

  @override
  Widget build(BuildContext context) {
    return KpisListView(
      future: procurementRepository.getProcurementKpis,
    );
  }
}
