import 'dart:async';

import 'package:pscct/services/http_service.dart';

import '../models/enums/pscct_categories.dart';
import '../models/pscct_report.dart';

abstract class PSCCTRepository {
  /*static final PSCCTRepository _pscctRepository = PSCCTRepository._internal();

  factory PSCCTRepository() {
    return _pscctRepository;
  }
  PSCCTRepository._internal();*/
  List<PSCCTReport>? _reportsList;
  Future<List<PSCCTReport>?> getReports(
      {required PSCCTCategories category}) async {
    if (_reportsList == null) {
      var data = await HttpService.get(path: "reports");
      print(data);
      return data;
    } else {
      return _reportsList;
    }
  }

  /* Future<List<PSCCTAlert>> getAlerts();

  Future<List<KPI>> getKPIs();*/
}
