import 'package:flutter/material.dart';
import 'package:pscct/Theme/theme.dart';
import 'package:pscct/models/assets.dart';
import 'package:pscct/size_config.dart';

class CustomNavBar extends StatelessWidget {
  final Function(int index)? onTap;
  final int selectedPageIndex;
  CustomNavBar({this.onTap, required this.selectedPageIndex, Key? key})
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

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 0,
      currentIndex: selectedPageIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) => onTap!(index),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: List.generate(
          bottomNavBarItems.length,
          (index) => BottomNavigationBarItem(
              icon: _buildIcon(bottomNavBarItems[index]["icon"],
                  bottomNavBarItems[index]["label"], index),
              label: "")),
    );
  }

  final _selectedItemColor = Colors.white;
  final _unselectedItemColor = AppTheme.primaryColor;
  final _selectedBgColor = AppTheme.primaryColor;
  final _unselectedBgColor = Colors.white;

  Color _getBgColor(int index) =>
      selectedPageIndex == index ? _selectedBgColor : _unselectedBgColor;
  double getFontSize(int index) => selectedPageIndex == index ? 14 : 12;
  Color _getItemColor(int index) =>
      selectedPageIndex == index ? _selectedItemColor : _unselectedItemColor;
  Widget _buildIcon(String image, String text, int index) => AnimatedContainer(
        width: double.infinity,
        height: getProportionateScreenHeight(80),
        color: _getBgColor(index),
        duration: const Duration(milliseconds: 500),
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
                    fontSize: getProportionateScreenHeight(getFontSize(index)),
                    color: _getItemColor(index))),
          ],
        ),
      );
}
