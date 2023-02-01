import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pscct/repositories/wh_logistics_repository.dart';
import 'package:pscct/shared-widgets/loading_circular.dart';

import '../../../shared-widgets/file_opener.dart';

class FileViewer extends StatelessWidget {
  FileViewer({required this.file_key, Key? key}) : super(key: key);
  final String file_key;

  final WarehouseLogisticsRepository warehouseLogisticsRepository =
      WarehouseLogisticsRepository();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File?>(
        future: warehouseLogisticsRepository.getFileData(file_key),
        builder: (context, file) {
          if (file.hasError)
            return Center(
                child: Text(
              (file.error as DioError).message,
              style: TextStyle(fontSize: 18, color: Colors.red),
            ));
          if (!file.hasData) return LoadingCircular();
          return FileOpener(file: file.data!);
        });
  }
}
