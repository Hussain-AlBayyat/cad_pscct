import 'package:flutter/material.dart';
import 'package:pscct/size_config.dart';

class SyncfusionDataGridChart extends StatelessWidget {
  SyncfusionDataGridChart({Key? key}) : super(key: key);

  static const List<Map> data1 = [
    {
      "Commodity": "OCTG",
      "6 < Month": "000",
      "6 - 12 Month": "000",
      "12 > Month": "000"
    },
    {
      "Commodity": "Mud & Chemical",
      "6 < Month": "000",
      "6 - 12 Month": "000",
      "12 > Month": "000"
    },
    {
      "Commodity": "Downhole",
      "6 < Month": "000",
      "6 - 12 Month": "000",
      "12 > Month": "000"
    },
    {
      "Commodity": "Line Poles & Hware",
      "6 < Month": "000",
      "6 - 12 Month": "000",
      "12 > Month": "000"
    },
    {
      "Commodity": "Total",
      "6 < Month": "000",
      "6 - 12 Month": "000",
      "12 > Month": "000"
    },
  ];
  // static EmployeeDataSource edata = EmployeeDataSource(data2);
  @override
  Widget build(BuildContext context) {
    //return Container();
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
              )),
              Text(
                "<6\nMonth",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: getProportionateScreenHeight(12),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: getProportionateScreenWidth(26),
              ),
              Text(
                "6-12\nMonth",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: getProportionateScreenHeight(12),
                    color: Color(0xFF00A3E0),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: getProportionateScreenWidth(26),
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
        Divider(
          color: Colors.grey,
          height: 2,
        ),
        ListView.separated(
          itemCount: data1.length,
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
                      data1[index]["Commodity"],
                      style: TextStyle(
                          fontSize: getProportionateScreenHeight(16),
                          fontWeight: data1.length - 1 == index
                              ? FontWeight.bold
                              : null),
                    ),
                  ),
                  Text(
                    data1[index]["6 < Month"],
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(16),
                        fontWeight:
                            data1.length - 1 == index ? FontWeight.bold : null),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(38),
                  ),
                  Text(
                    data1[index]["6 - 12 Month"],
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(16),
                        fontWeight:
                            data1.length - 1 == index ? FontWeight.bold : null),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(38),
                  ),
                  Text(
                    data1[index]["12 > Month"],
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(16),
                        fontWeight:
                            data1.length - 1 == index ? FontWeight.bold : null),
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
