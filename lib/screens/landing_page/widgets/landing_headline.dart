import 'package:flutter/material.dart';
import 'package:pscct/size_config.dart';

import '../../../models/assets.dart';

class LandingPageHeadline extends StatelessWidget {
  const LandingPageHeadline({Key? key}) : super(key: key);
  final headline = "Procurement & Supply Chain Control Tower";
  final subtitle = "Where Data is Opportunity";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            Assets.logo,
            width: getProportionateScreenWidth(88),
            height: getProportionateScreenHeight(88),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(32),
        ),
        Center(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  Assets.logoText,
                  width: getProportionateScreenWidth(300),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: getProportionateScreenHeight(15),
                      color: Color(0xFF8E9090)),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(32),
        ),
      ],
    );
  }
}
