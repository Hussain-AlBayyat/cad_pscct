import 'package:flutter/material.dart';
import 'package:pscct/shared-widgets/loading_circular.dart';

import '../shared-widgets/report.dart';
import '../size_config.dart';

class DialogController {
  static showFullDialog(BuildContext context) {
    showDialog(
        context: context,
        useSafeArea: false,
        barrierDismissible: false,
        builder: (BuildContext buildContext) {
          return Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: LoadingCircular(
                      width: getProportionateScreenWidth(100),
                      height: getProportionateScreenHeight(100),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  static showPopup(String dialogTitle, String description, BuildContext context,
      {Widget? dialogBody}) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionBuilder: (context, a1, a2, widget) {
          if (a2.value == 1) return Container();
          return Transform.scale(
            scale: a1.value,
            child: Dismissible(
              direction: DismissDirection.vertical,
              onDismissed: (_) {
                Navigator.of(context).pop();
              },
              key: UniqueKey(),
              child: Opacity(
                  opacity: a1.value,
                  child: Dialog(
                    insetPadding:
                        EdgeInsets.all(getProportionateScreenHeight(20)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            getProportionateScreenHeight(12))),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: SizeConfig.screenHeight * .7),
                      child: Report(
                        title: dialogTitle,
                        description: description,
                        body: Visibility(
                          visible: dialogBody != null,
                          replacement: Container(),
                          child: FutureBuilder(
                              future: Future.delayed(Duration(seconds: 0)),
                              builder: (c, s) =>
                                  s.connectionState == ConnectionState.done
                                      ? dialogBody ??
                                          Container(
                                            child: Text("test"),
                                          )
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
                  )),
            ),
          );
        },
        pageBuilder: (context, animation1, animation2) {
          return Text("weqwewqewqe");
        });
  }
}
