import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pscct/shared-widgets/pdf_viewer.dart';

import '../size_config.dart';

class FileOpener extends StatelessWidget {
  const FileOpener({required this.file, Key? key}) : super(key: key);
  final File file;
  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: file.path.contains("pdf"),
        child: SizedBox(
            height: SizeConfig.screenHeight * .7,
            child: PdfViewer(filePath: file.path)),
        replacement: InteractiveViewer(maxScale: 3, child: Image.file(file)));
  }
}
