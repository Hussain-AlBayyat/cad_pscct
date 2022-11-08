import 'package:flutter/material.dart';
import 'package:pscct/models/dialog_controller.dart';
import 'package:pscct/shared-widgets/custom_card.dart';
import 'package:pscct/size_config.dart';

class ReportButton extends StatelessWidget {
  const ReportButton(
      {required this.buttonText,
      required this.buttonIcon,
      required this.dialogWidget,
      required this.description,
      Key? key})
      : super(key: key);
  final String buttonText, buttonIcon, description;
  final Widget dialogWidget;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(165),
      height: getProportionateScreenHeight(130),
      child: CustomCard(
        child: TextButton(
            style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                backgroundColor: Colors.white),
            onPressed: () {
              DialogController.showPopup(buttonText, description, context,
                  dialogBody: dialogWidget);
              /*showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  builder: (context) {
                    return Report(
                      title: buttonText,
                      body: bottomSheetWidget,
                    );
                  });*/
            }, //=> onButtonPress!(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(16),
                ),
                Image.asset(
                  buttonIcon,
                  width: getProportionateScreenHeight(40),
                  height: getProportionateScreenHeight(40),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      buttonText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF323232),
                          fontSize: getProportionateScreenHeight(16)),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
