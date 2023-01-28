import 'package:flutter/material.dart';
import 'package:pscct/models/assets.dart';
import 'package:pscct/models/dialog_controller.dart';
import 'package:pscct/models/pscct_kpi.dart';
import 'package:pscct/shared-widgets/custom_card.dart';
import 'package:pscct/size_config.dart';

import '../helper.dart';

class KPI extends StatelessWidget {
  KPI({required this.kpi, Key? key}) : super(key: key);

  final PSCCTKpi kpi;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(165),
      height: getProportionateScreenHeight(160),
      child: GestureDetector(
        onTap: () => DialogController.showPopup(
          kpi.Title,
          kpi.Description,
          context,
        ),
        child: CustomCard(
            color: Theme.of(context).cardColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: getProportionateScreenHeight(7),
                      right: getProportionateScreenWidth(7)),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      Assets.moreInfoIcon,
                      height: getProportionateScreenHeight(20),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(16),
                    ),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        kpi.Title,
                        style: TextStyle(
                            color: Theme.of(context).highlightColor,
                            fontSize: getProportionateScreenHeight(16)),
                      ),
                    ),
                  ),
                ),
                /*   SizedBox(
              height: getProportionateScreenHeight(6),
            ),*/
                Padding(
                  padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(16),
                    right: getProportionateScreenWidth(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${Helper.compactNumber(kpi.Value)}${kpi.Uom == "%" ? "%" : " ${kpi.Uom}"}",
                        style: TextStyle(
                            fontSize: getProportionateScreenHeight(32),
                            color: Theme.of(context).highlightColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (double.parse(kpi.Value) >=
                              double.parse(kpi.Target))
                            Image.asset(
                              kpi.Inversed ? Assets.downIcon : Assets.upIcon,
                              color: Colors.green,
                              height: getProportionateScreenHeight(14),
                            )
                          else
                            Image.asset(
                              kpi.Inversed ? Assets.upIcon : Assets.downIcon,
                              color: Colors.red,
                              height: getProportionateScreenHeight(14),
                            ),
                          SizedBox(
                            width: getProportionateScreenWidth(10),
                          ),
                          Expanded(
                            child: Text(
                              "FYP ${kpi.Target}${kpi.Uom == "%" ? "%" : " ${kpi.Uom}"}",
                              style: TextStyle(
                                  fontSize: getProportionateScreenHeight(16),
                                  color: Color(0xFF8E9090)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
