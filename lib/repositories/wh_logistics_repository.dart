import 'dart:io';

import 'package:pscct/models/enums/pscct_categories.dart';
import 'package:pscct/models/pscct_report.dart';
import 'package:pscct/repositories/pscct_repository.dart';

import '../models/pscct_alert.dart';
import '../models/pscct_kpi.dart';

class WarehouseLogisticsRepository extends PSCCTRepository {
  static final WarehouseLogisticsRepository _whLogiticsRepository =
      WarehouseLogisticsRepository._internal();
  factory WarehouseLogisticsRepository() {
    return _whLogiticsRepository;
  }
  Future<List<PSCCTReport>> getWhLogisticsReports() async {
    List<PSCCTReport> reports =
        await this.getReports(category: PSCCTCategories.LG);
    return reports;
  }

  Future<List<PSCCTAlert>> getWhLogisticsAlerts() async {
    List<PSCCTAlert> alerts =
        await this.getAlerts(category: PSCCTCategories.LG);
    return alerts;
  }

  Future<List<PSCCTKpi>> getWhLogisticsKpis() async {
    List<PSCCTKpi> kpis = await this.getKpis(category: PSCCTCategories.LG);
    return kpis;
  }

  Future<File?> getCo2Image(String id) async {
    File? file = await this.getImage(id: id);
    return file;
  }

  WarehouseLogisticsRepository._internal();
}
