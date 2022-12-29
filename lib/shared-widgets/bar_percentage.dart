import 'package:flutter/material.dart';
import 'package:pscct/Theme/theme.dart';
import 'package:pscct/helper.dart';
import 'package:pscct/size_config.dart';

class SpendItem extends StatelessWidget {
  const SpendItem(
      {required this.amount, this.title = "Dummy", this.color, Key? key})
      : super(key: key);

  final String amount;
  final Color? color;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: getProportionateScreenHeight(18)),
                ),
              ),
              Text(
                "\$${Helper.compactNumber2(amount)}",
                style:
                    TextStyle(color: AppTheme.primaryColorLight, fontSize: 24),
              ),

              // Text(
              //   "%$percentage",
              //   style: TextStyle(color: Colors.grey, fontSize: 20),
              // )
            ],
          ),
        ),
        Divider(
          height: 2,
          color: Colors.grey,
        )
        /* Stack(
          children: <Widget>[
            Container(
              width: SizeConfig.screenWidth * 0.73,
              height: 4,
              decoration: BoxDecoration(
                  color: Theme.of(context).focusColor,
                  borderRadius: BorderRadius.circular(6)),
            ),
            Container(
              width: (percentage / 100) * SizeConfig.screenWidth * 0.73,
              height: 4,
              decoration: BoxDecoration(
                  color: color ?? AppTheme.secondColor,
                  borderRadius: BorderRadius.circular(6)),
            ),
          ],
        ),*/
      ],
    );
  }
}
