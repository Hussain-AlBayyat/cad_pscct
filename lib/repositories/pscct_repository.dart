import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pscct/helper.dart';
import 'package:pscct/models/pscct_alert.dart';
import 'package:pscct/models/pscct_kpi.dart';
import 'package:pscct/services/http_service.dart';

import '../models/enums/pscct_categories.dart';
import '../models/pscct_report.dart';

abstract class PSCCTRepository {
  static String _prefix = "/MobComponents";
  //Development
  static String dvbOdataUrl =
      "https://dvb.aramco.com.sa:44303/sap/opu/odata/sap/zscm_ct_config_srv";
  static const String dvbBspUrl =
      "https://dvb.aramco.com.sa:44303/sap/bc/bsp/sap/zbw_reporting/execute_report_oo.htm?query=";
  //Production
  static String prOdataUrl =
      "https://prwascs.aramco.com.sa:44303/sap/opu/odata/sap/zscm_ct_config_srv";
  static const String prBspUrl =
      "https://prwascs.aramco.com.sa: 44382/sap/bc/bsp/sap/zbw_reporting/execute_report_oo.htm?query=";

  static String _alertsPath =
      "$prOdataUrl$_prefix?\$format=json&\$filter=(ComponentCategory eq 'A')&\$expand=DataSourceNav";
  static String _kpisPath =
      "$prOdataUrl$_prefix?\$format=json&\$filter=(ComponentCategory eq 'K')&\$expand=DataSourceNav";
  static String _reportsPath =
      "$prOdataUrl$_prefix?\$format=json&\$filter=(ComponentCategory eq 'O')&\$expand=DataSourceNav";

  String _pdfPath = "$prOdataUrl/FilePDFs('pdf')?\$format=json";
  String _imagePath = "$prOdataUrl/FileUtils";

  static List<PSCCTReport> _reportsList = [];
  static List<PSCCTAlert> _alertsList = [];
  static List<PSCCTKpi> _kpisList = [];
  static var pdf;
  //For testing
  static File? _pdfFile, _co2Image;
  static updateOdataUrl(String url) {
    prOdataUrl = url;
  }

  getAlerts({required PSCCTCategories category}) async {
    if (_alertsList.isEmpty) {
      Response response = await HttpService.get(path: _alertsPath);
      List data = response.data["d"]["results"];
      _alertsList.addAll(data.map((e) => PSCCTAlert.fromJson(e)).toList());
      _alertsList
          .sort((item1, item2) => item1.OrderOnApp.compareTo(item2.OrderOnApp));
    }

    return _alertsList
            ?.where((alert) => alert.Category == category.name)
            .toList() ??
        _alertsList;
  }

  getKpis({required PSCCTCategories category}) async {
    if (_kpisList.isEmpty) {
      Response response = await HttpService.get(path: _kpisPath);
      List data = response.data["d"]["results"];
      _kpisList.addAll(data.map((e) => PSCCTKpi.fromJson(e)).toList());
      _kpisList
          .sort((item1, item2) => item1.OrderOnApp.compareTo(item2.OrderOnApp));
    }

    return _kpisList?.where((kpi) => kpi.Category == category.name).toList() ??
        _kpisList;
  }

  Future<List<PSCCTReport>> getReports({PSCCTCategories? category}) async {
    //HttpService.addInterceptor(interceptorsWrapper: MockInterceptor());
    if (_reportsList.isEmpty) {
      Response response = await HttpService.get(path: _reportsPath);
      List data = response.data["d"]["results"];
      _reportsList.addAll(data.map((e) => PSCCTReport.fromJson(e)).toList());
      _reportsList
          .sort((item1, item2) => item1.OrderOnApp.compareTo(item2.OrderOnApp));
    }

    return _reportsList
            ?.where((report) => report.Category == category?.name)
            .toList() ??
        _reportsList;
  }

  Future<File?> getImage({required String id}) async {
    //HttpService.addInterceptor(interceptorsWrapper: MockInterceptor());
    //if (_co2Image != null) return _co2Image;
    var imagePath = "$_imagePath('$id')?\$format=json";
    Response response = await HttpService.get(path: imagePath /*_reportsPath*/);
    Map data = response.data["d"];
    _co2Image = await fileFromBlob(data);
    return _co2Image;
  }

  Future<File?> getPdfFile() async {
    //HttpService.addInterceptor(interceptorsWrapper: MockInterceptor());
    if (_pdfFile != null) return _pdfFile;
    Response response = await HttpService.get(path: _pdfPath /*_reportsPath*/);
    Map data = response.data["d"];
    _pdfFile = await fileFromBlob(data);
    return _pdfFile;
  }

  fileFromBlob(Map data) async {
    var base64 = data["Blob"];
    var decodedBytes = base64Decode(base64.replaceAll('\n', ''));
    String dir = (await getApplicationDocumentsDirectory()).path;
    String fileType = data['FileType'].toString();
    fileType = fileType.substring(fileType.lastIndexOf("/") + 1);
    File file = new File('$dir/$fileType');
    await file.writeAsBytes(decodedBytes.buffer.asUint8List());
    return file;
  }

  Future<List<Map>> getAlertTrend(String queryName) async {
    String url = "$prBspUrl$queryName";
    Response response = await HttpService.get(path: url /*_reportsPath*/);
    var json = Helper.convertXmlToJsonList(response.data);

    return json;
  }

  static clear() {
    _alertsList.clear();
    _kpisList.clear();
    _reportsList.clear();
    _pdfFile = null;
    _co2Image = null;
  }
}
