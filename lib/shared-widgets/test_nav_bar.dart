import 'package:flutter/material.dart';
import 'package:pscct/models/assets.dart';
import 'package:pscct/size_config.dart';

class TestNavBar extends StatelessWidget {
  final Function(int index)? onTap;
  final int selectedPageIndex;
  TestNavBar({this.onTap, required this.selectedPageIndex, Key? key})
      : super(key: key);
  static final iconHeight = getProportionateScreenHeight(25);

  final List<Map<String, dynamic>> bottomNavBarItems = [
    {
      "label": "Procurement",
      "icon": Assets.blueProcurementIcon,
    },
    {
      "label": "WH & Logistics",
      "icon": Assets.blueWhIcon,
    },
    {
      "label": "Inventory",
      "icon": Assets.inventoryIcon,
    },
  ];
  late final _selectedItemColor;
  late final _unselectedItemColor;
  late final _selectedBgColor;
  late final _unselectedBgColor;

  @override
  Widget build(BuildContext context) {
    _selectedItemColor = Theme.of(context).scaffoldBackgroundColor;
    _unselectedItemColor = Theme.of(context).primaryColor;
    _selectedBgColor = Theme.of(context).primaryColor;
    _unselectedBgColor = Theme.of(context).scaffoldBackgroundColor;

    return Row(children: [
      ...List.generate(
        bottomNavBarItems.length,
        (index) => _buildIcon(bottomNavBarItems[index]["icon"],
            bottomNavBarItems[index]["label"], index),
      ),
    ]);
  }

  Color _getBgColor(int index) =>
      selectedPageIndex == index ? _selectedBgColor : _unselectedBgColor;
  double getFontSize(int index) => selectedPageIndex == index ? 14 : 12;
  Color _getItemColor(int index) =>
      selectedPageIndex == index ? _selectedItemColor : _unselectedItemColor;
  Widget _buildIcon(String image, String text, int index) =>
      OrientationBuilder(builder: (context, _) {
        return AnimatedContainer(
          width: SizeConfig.screenWidth / 3,
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          height: getProportionateScreenHeight(80),
          color: _getBgColor(index),
          duration: const Duration(milliseconds: 100),
          child: InkWell(
            onTap: () => onTap!(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  image,
                  height: iconHeight,
                  color: _getItemColor(index),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(8),
                ),
                Text(text,
                    style: TextStyle(
                        fontSize:
                            getProportionateScreenHeight(getFontSize(index)),
                        color: _getItemColor(index))),
              ],
            ),
          ),
        );
      });
}
