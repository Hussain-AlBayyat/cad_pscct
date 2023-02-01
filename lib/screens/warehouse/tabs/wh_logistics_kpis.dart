import 'package:flutter/material.dart';
import 'package:pscct/repositories/wh_logistics_repository.dart';

import '../../../shared-widgets/lists/kpis_list_view.dart';

class WarehouseLogisticsKpis extends StatelessWidget {
  WarehouseLogisticsKpis({Key? key}) : super(key: key);
  final WarehouseLogisticsRepository whLogisticsRepository =
      WarehouseLogisticsRepository();

  @override
  Widget build(BuildContext context) {
    return KpisListView(
      future: whLogisticsRepository.getWhLogisticsKpis,
    );
  }
}
