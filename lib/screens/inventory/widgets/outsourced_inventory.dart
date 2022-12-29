import 'package:flutter/material.dart';

import '../../../helper.dart';
import '../../../size_config.dart';

class OutsourcedInventory extends StatelessWidget {
  OutsourcedInventory({required this.data, Key? key}) : super(key: key);
  final List<Map> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenHeight(16)),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Commodity",
                  style: TextStyle(
                      fontSize: getProportionateScreenHeight(12),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "<6\nMonth",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: getProportionateScreenHeight(12),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "6-12\nMonth",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: getProportionateScreenHeight(12),
                          color: Color(0xFF00A3E0),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "12>\nMonth",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: getProportionateScreenHeight(12),
                          color: Color(0xFFDC3C3C),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey,
          height: 2,
        ),
        ListView.separated(
          itemCount: data.length,
          primary: false,
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(color: Colors.grey, height: 1),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(16)),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      data.toList()[index].values.first,
                      style: TextStyle(
                          fontSize: getProportionateScreenHeight(16),
                          fontWeight: data.length - 1 == index
                              ? FontWeight.bold
                              : null),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Text(
                            Helper.compactNumber(
                                data.toList()[index].values.toList()[1]),
                            style: TextStyle(
                                fontSize: getProportionateScreenHeight(16),
                                fontWeight: data.length - 1 == index
                                    ? FontWeight.bold
                                    : null),
                          ),
                          Text(
                            Helper.compactNumber(
                                data.toList()[index].values.toList()[2]),
                            style: TextStyle(
                                fontSize: getProportionateScreenHeight(16),
                                fontWeight: data.length - 1 == index
                                    ? FontWeight.bold
                                    : null),
                          ),
                          Text(
                            Helper.compactNumber(
                                data.toList()[index].values.toList()[3]),
                            style: TextStyle(
                                fontSize: getProportionateScreenHeight(16),
                                fontWeight: data.length - 1 == index
                                    ? FontWeight.bold
                                    : null),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
