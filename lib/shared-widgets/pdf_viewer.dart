import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfViewer extends StatelessWidget {
  const PdfViewer({required this.filePath, Key? key}) : super(key: key);
  final String filePath;
  @override
  Widget build(BuildContext context) {
    return PDF(
      swipeHorizontal: false,
      autoSpacing: false,
      fitEachPage: true,
      fitPolicy: FitPolicy.BOTH,
      pageFling: false,
      nightMode: Theme.of(context).brightness == Brightness.dark ? true : false,
      onError: (error) {
        print(error.toString());
      },
      onPageError: (page, error) {
        print('$page: ${error.toString()}');
      },
    ).fromPath(filePath);
  }
}
