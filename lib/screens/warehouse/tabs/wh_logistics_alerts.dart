import 'package:flutter/material.dart';
import 'package:pscct/models/pscct_alert.dart';
import 'package:pscct/repositories/wh_logistics_repository.dart';

import '../../../shared-widgets/alert.dart';
import '../../../shared-widgets/lists/alerts_list_view.dart';

class WarehouseLogisticsAlerts extends StatelessWidget {
  WarehouseLogisticsAlerts({Key? key}) : super(key: key);
  final WarehouseLogisticsRepository wareHouseRepository =
      WarehouseLogisticsRepository();

  @override
  Widget build(BuildContext context) {
    return AlertsListView(future: wareHouseRepository.getWhLogisticsAlerts);
  }
}
