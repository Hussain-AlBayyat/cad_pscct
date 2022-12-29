import 'package:flutter/material.dart';
import 'package:pscct/repositories/wh_logistics_repository.dart';
import 'package:pscct/screens/warehouse/widgets/co2_emission_target2.dart';
import 'package:pscct/screens/warehouse/widgets/pending_goods_receipt.dart';

import '../../../models/assets.dart';
import '../../../shared-widgets/lists/reports_list_view.dart';
import '../../../shared-widgets/overview.dart';
import '../widgets/shipping_price_index.dart';

class WarehouseLogisticsOverview extends StatelessWidget {
  WarehouseLogisticsOverview({Key? key}) : super(key: key);

  final WarehouseLogisticsRepository whLogisticsRepository =
      WarehouseLogisticsRepository();
  @override
  Widget build(BuildContext context) {
    return ReportsListView(future: whLogisticsRepository.getWhLogisticsReports);
  }
}
