import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pscct/repositories/global_market_repository.dart';

import '../../shared-widgets/default_widgets/default_scaffold.dart';
import '../../shared-widgets/loading_circular.dart';
import '../../shared-widgets/pdf_viewer.dart';

class GlobalMarketReportScreen extends StatelessWidget {
  GlobalMarketReportScreen({Key? key}) : super(key: key);
  final GlobalMarketRepository globalMarketRepository =
      GlobalMarketRepository();
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: "Global Market Report",
      addSpacing: false,
      body: [
        FutureBuilder(
            future: globalMarketRepository.getPdf(),
            builder: (context, file) {
              if (file.hasError)
                return Expanded(
                  child: Center(
                      child: Text(
                    (file.error as DioError).message,
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  )),
                );
              if (!file.hasData) {
                return Expanded(child: Center(child: LoadingCircular()));
              }

              return Flexible(
                  child: PdfViewer(
                filePath: file.data!.path,
              ));
            }),
      ],
    );
  }
}
