import 'package:flutter/material.dart';
import 'package:pscct/models/enums/pscct_categories.dart';

import 'package:pscct/shared-widgets/lists/reports_list_view.dart';

import '../../../repositories/procurement_repository.dart';

class ProcurementOverview extends StatelessWidget {
  ProcurementOverview({Key? key}) : super(key: key);

  final ProcurementRepository procurementRepository = ProcurementRepository();
  @override
  Widget build(BuildContext context) {
    return ReportsListView(future: procurementRepository.getProcurementReports);
  }
}
