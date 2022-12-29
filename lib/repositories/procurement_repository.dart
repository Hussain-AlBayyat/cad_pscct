import 'package:pscct/models/enums/pscct_categories.dart';
import 'package:pscct/models/pscct_alert.dart';
import 'package:pscct/models/pscct_kpi.dart';
import 'package:pscct/models/pscct_report.dart';
import 'package:pscct/repositories/pscct_repository.dart';

class ProcurementRepository extends PSCCTRepository {
  static final ProcurementRepository _procurementRepository =
      ProcurementRepository._internal();
  factory ProcurementRepository() {
    return _procurementRepository;
  }
  Future<List<PSCCTReport>> getProcurementReports() async {
    List<PSCCTReport> reports =
        await this.getReports(category: PSCCTCategories.PR);
    return reports;
  }

  Future<List<PSCCTAlert>> getProcurementAlerts() async {
    List<PSCCTAlert> alerts =
        await this.getAlerts(category: PSCCTCategories.PR);
    return alerts;
  }

  Future<List<PSCCTKpi>> getProcurementKpis() async {
    List<PSCCTKpi> kpis = await this.getKpis(category: PSCCTCategories.PR);
    return kpis;
  }

  ProcurementRepository._internal();
}
