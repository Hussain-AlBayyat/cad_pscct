import 'package:flutter/material.dart';
import 'package:pscct/models/assets.dart';
import 'package:pscct/models/dialog_controller.dart';
import 'package:pscct/shared-widgets/custom_card.dart';
import 'package:pscct/size_config.dart';

class KPI extends StatelessWidget {
  KPI(
      {required this.title,
      required this.subtitle,
      required this.value,
      required this.target,
      required this.description,
      Key? key})
      : super(key: key);
  final String title, subtitle, description;
  final int target, value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(165),
      height: getProportionateScreenHeight(160),
      child: GestureDetector(
        onTap: () => DialogController.showPopup(
          title,
          description,
          context,
        ),
        child: CustomCard(
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
                    title,
                    style:
                        TextStyle(fontSize: getProportionateScreenHeight(16)),
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
                    "$value%",
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(36),
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (value > target)
                        Image.asset(
                          Assets.upIcon,
                          color: Colors.green,
                          height: getProportionateScreenHeight(14),
                        )
                      else
                        Image.asset(
                          Assets.downIcon,
                          color: Colors.red,
                          height: getProportionateScreenHeight(14),
                        ),
                      SizedBox(
                        width: getProportionateScreenWidth(10),
                      ),
                      Text(
                        "$subtitle $target%",
                        style: TextStyle(
                            fontSize: getProportionateScreenHeight(16),
                            color: Color(0xFF8E9090)),
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
