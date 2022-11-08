import 'dart:async';

import 'package:pscct/models/enums/pscct_categories.dart';
import 'package:pscct/models/pscct_report.dart';
import 'package:pscct/repositories/pscct_repository.dart';

class ProcurementRepository extends PSCCTRepository {
  static final ProcurementRepository _procurementRepository =
      ProcurementRepository._internal();
  factory ProcurementRepository() {
    return _procurementRepository;
  }

  ProcurementRepository._internal();

  @override
  Future<List<PSCCTReport>?> getProcurementReports() async {
    // TODO: implement getReports
    var x = await getReports(category: PSCCTCategories.Procurement);
    print(x);
    return [];
  }
}
