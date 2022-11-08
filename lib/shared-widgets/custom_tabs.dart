import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class CustomTabs extends StatelessWidget {
  const CustomTabs(
      {required this.tabPages,
      this.tabsLabel = const [
        Constants.overview,
        Constants.kpi,
        Constants.alerts
      ],
      Key? key})
      : super(key: key);
  final List<Widget> tabPages;
  final List<String> tabsLabel;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabPages.length,
        child: Column(children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            //padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius:
                  BorderRadius.circular(4), /* color: Colors.grey.shade200*/
            ),
            child: TabBar(
                unselectedLabelColor: Colors.black,
                labelStyle:
                    TextStyle(fontSize: getProportionateScreenHeight(14)),
                indicator: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(4)),
                labelColor: Theme.of(context).primaryColor,
                tabs: [
                  ...List.generate(
                      tabsLabel.length,
                      (index) => Tab(
                            height: 40,
                            text: tabsLabel[index],
                          ))
                ]),
          ),
          Flexible(
              child: NotificationListener(
                  onNotification: (overscroll) {
                    if (overscroll is OverscrollNotification &&
                        overscroll.overscroll != 0 &&
                        overscroll.dragDetails != null) {
                      print(overscroll.toString());
                      /*_pageController.animateToPage(overscroll.overscroll < 0 ? 0 : 2,
                      curve: Curves.ease, duration: Duration(milliseconds: 250));*/
                    }
                    return true;
                  },
                  child: TabBarView(children: [
                    ...List.generate(
                        tabPages.length,
                        (index) => SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Center(child: tabPages[index]),
                              ),
                            )),
                  ])))
        ]));
  }
}
