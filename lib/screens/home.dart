import 'package:flutter/material.dart';
import 'package:pscct/constants.dart';
import 'package:pscct/screens/inventory/inventory_screen.dart';
import 'package:pscct/screens/procurement/procurement_screen.dart';
import 'package:pscct/screens/warehouse/warehouse_screen.dart';

import '../shared-widgets/default_widgets/default_scaffold.dart';

class Home extends StatefulWidget {
  final int selectedPageIndex;
  Home({required this.selectedPageIndex, Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> pages = [
    ProcurementScreen(),
    WarehouseScreen(),
    InventoryScreen(),
  ];

  late int index;
  static const List<String> titles = [
    Constants.procurement,
    Constants.wareHouseAndLogistics,
    Constants.inventory
  ];

  @override
  void initState() {
    setSelectedPage();
    super.initState();
  }

  setSelectedPage() {
    if (widget.selectedPageIndex == 1) {
      index = widget.selectedPageIndex;
      index++;
    } else if (widget.selectedPageIndex == 2) {
      index = widget.selectedPageIndex;
      index--;
    } else {
      index = widget.selectedPageIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      pageIndex: index,
      enablePaging: true,
      onPageChanged: changeTitle,
      title: titles[index],
      body: pages,
    );
  }

  changeTitle(int pageIndex) {
    setState(() {
      index = pageIndex;
    });
  }
}
