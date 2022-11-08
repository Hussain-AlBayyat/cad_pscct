import 'package:flutter/material.dart';
import 'package:pscct/repositories/procurement_repository.dart';

import 'package:pscct/screens/procurement/tabs/procurement_alerts.dart';
import 'package:pscct/screens/procurement/tabs/procurement_kpis.dart';
import 'package:pscct/screens/procurement/tabs/procurement_overview.dart';

import '../../shared-widgets/custom_tabs.dart';

class ProcurementScreen extends StatelessWidget {
  ProcurementScreen({Key? key}) : super(key: key);
  final List<Widget> tabPages = [
    ProcurementOverview(),
    const ProcurementKpis(),
    ProcurementAlerts(),
  ];
  final ProcurementRepository procurementRepository = ProcurementRepository();
  @override
  Widget build(BuildContext context) {
    procurementRepository.getProcurementReports();
    return CustomTabs(
      tabPages: tabPages,
    );
  }
}
