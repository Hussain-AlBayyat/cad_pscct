import 'package:flutter/material.dart';
import 'package:pscct/models/assets.dart';
import 'package:pscct/models/dialog_controller.dart';
import 'package:pscct/models/pscct_alert.dart';
import 'package:pscct/screens/procurement/widgets/iktva.dart';
import 'package:pscct/size_config.dart';

class Alert extends StatelessWidget {
  Alert({required this.pscctAlert, Key? key}) : super(key: key);
  final PSCCTAlert pscctAlert;
  late final Color statusColor;
  @override
  Widget build(BuildContext context) {
    if (pscctAlert.value > pscctAlert.target) {
      statusColor = Color(0xFFDC3C3C);
    } else if (pscctAlert.value == pscctAlert.target) {
      statusColor = Color(0xFFF8CB0B);
    } else {
      statusColor = Color(0xFF84BD00);
    }
    return GestureDetector(
      onTap: () => DialogController.showPopup(
        pscctAlert.title,
        pscctAlert.description,
        dialogBody: IKTVA(),
        context,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Image.asset(Assets.alertIcon,
                height: getProportionateScreenHeight(26), color: statusColor),
            SizedBox(
              width: getProportionateScreenWidth(16),
            ),
            Expanded(
              child: Text(
                pscctAlert.title,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Column(
              children: [
                Text(
                  "${pscctAlert.value}",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
                Container(
                    width: getProportionateScreenWidth(33),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: statusColor),
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    child: Text(
                      "${pscctAlert.target - pscctAlert.value}",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
            SizedBox(
              width: getProportionateScreenWidth(16),
            ),
            Image.asset(
              Assets.moreInfoIcon,
              height: getProportionateScreenHeight(20),
            ),
          ],
        ),
      ),
    );
  }
}
