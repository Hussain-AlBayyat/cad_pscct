import 'package:flutter/material.dart';

import '../screens/procurement/widgets/iktva.dart';
import '../shared-widgets/report.dart';
import '../size_config.dart';

class DialogController {
  static showPopup(String dialogTitle, String description, BuildContext context,
      {Widget? dialogBody}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext buildContext) {
          return Dismissible(
            direction: DismissDirection.vertical,
            onDismissed: (_) {
              Navigator.of(context).pop();
            },
            key: Key(dialogTitle),
            child: Dialog(
              insetPadding: EdgeInsets.all(getProportionateScreenHeight(20)),
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(getProportionateScreenHeight(12))),
              child: Report(
                title: dialogTitle,
                description: description,
                body: Visibility(
                  visible: dialogBody != null,
                  replacement: Container(),
                  child: FutureBuilder(
                      future: Future.delayed(Duration(seconds: 2)),
                      builder: (c, s) =>
                          s.connectionState == ConnectionState.done
                              ? dialogBody ?? IKTVA()
                              : CircularProgressIndicator(
                                  color: Theme.of(context).primaryColor,
                                )),
                ),
                /*
                FutureBuilder(
                  future: Future.delayed(Duration(seconds: 2)),
                  builder: (buildContext, _) {
                    return _.connectionState == ConnectionState.done
                        ? CircularProgressIndicator()
                        : dialogBody ?? IKTVA();
                  },
                ),*/
              ),
            ),
          );
        });
  }
}
