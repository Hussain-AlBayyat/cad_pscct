import 'dart:io';

import 'package:pscct/repositories/pscct_repository.dart';

class GlobalMarketRepository extends PSCCTRepository {
  static final GlobalMarketRepository _globalMarketRepository =
      GlobalMarketRepository._internal();
  factory GlobalMarketRepository() {
    return _globalMarketRepository;
  }
  Future<File?> getPdf() async {
    return await _globalMarketRepository.getPdfFile();
  }

  GlobalMarketRepository._internal();
}
