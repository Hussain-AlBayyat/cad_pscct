import 'package:flutter/material.dart';

import 'package:pscct/size_config.dart';

class Report extends StatelessWidget {
  final String title;
  final String description;
  final Widget body;
  const Report(
      {required this.title,
      required this.description,
      required this.body,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20), vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 32,
                    height: 30,
                  ),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Hero(
                          tag: title,
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: getProportionateScreenHeight(18),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close,
                      color: Color(0xFF5F6369),
                      size: getProportionateScreenHeight(36),
                    ),
                  ),
                ]),
            Text(
              description,
              style: TextStyle(fontSize: getProportionateScreenHeight(14)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 32),
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}
