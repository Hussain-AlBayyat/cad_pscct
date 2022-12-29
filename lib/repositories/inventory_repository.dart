import 'package:pscct/models/enums/pscct_categories.dart';
import 'package:pscct/models/pscct_report.dart';
import 'package:pscct/repositories/pscct_repository.dart';

import '../models/pscct_alert.dart';
import '../models/pscct_kpi.dart';

class InventoryRepository extends PSCCTRepository {
  static final InventoryRepository _inventoryRepository =
      InventoryRepository._internal();
  factory InventoryRepository() {
    return _inventoryRepository;
  }
  Future<List<PSCCTReport>> getInventoryReports() async {
    List<PSCCTReport> reports =
        await this.getReports(category: PSCCTCategories.IN);
    return reports;
  }

  Future<List<PSCCTAlert>> getInventoryAlerts() async {
    List<PSCCTAlert> alerts =
        await this.getAlerts(category: PSCCTCategories.IN);
    return alerts;
  }

  Future<List<PSCCTKpi>> getInventoryKpis() async {
    List<PSCCTKpi> kpis = await this.getKpis(category: PSCCTCategories.IN);
    return kpis;
  }

  InventoryRepository._internal();
}
