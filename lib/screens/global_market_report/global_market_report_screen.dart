import 'package:flutter/material.dart';

import 'package:pscct/models/assets.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../shared-widgets/default_widgets/default_scaffold.dart';

class GlobalMarketReportScreen extends StatelessWidget {
  GlobalMarketReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: "Global Market Report",
      addSpacing: false,
      body: [
        Flexible(
          child: SfPdfViewer.asset(
            Assets.globalMarketReportPdf,
            scrollDirection: PdfScrollDirection.vertical,
            onPageChanged: (_) {},
            pageLayoutMode: PdfPageLayoutMode.continuous,
          ),
        ),
      ],
    );
  }
}
