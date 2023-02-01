import 'package:flutter/material.dart';
import 'package:pscct/repositories/wh_logistics_repository.dart';

import '../../../shared-widgets/lists/reports_list_view.dart';

class WarehouseLogisticsOverview extends StatelessWidget {
  WarehouseLogisticsOverview({Key? key}) : super(key: key);

  final WarehouseLogisticsRepository whLogisticsRepository =
      WarehouseLogisticsRepository();
  @override
  Widget build(BuildContext context) {
    return ReportsListView(future: whLogisticsRepository.getWhLogisticsReports);
  }
}
