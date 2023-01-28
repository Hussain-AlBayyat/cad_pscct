import 'package:flutter/material.dart';
import 'package:pscct/size_config.dart';
import 'package:simple_html_css/simple_html_css.dart';

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
                                color: Theme.of(context).highlightColor,
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
                      color: Theme.of(context).highlightColor,
                      size: getProportionateScreenHeight(36),
                    ),
                  ),
                ]),
            RichText(
              text: HTML.toTextSpan(context, description,
                  defaultTextStyle:
                      TextStyle(color: Theme.of(context).highlightColor)),
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
