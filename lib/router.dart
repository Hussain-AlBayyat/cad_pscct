import 'package:flutter/material.dart';
import 'package:pscct/screens/home.dart';
import 'package:pscct/screens/global_market_report/global_market_report_screen.dart';
import 'package:pscct/screens/inventory/inventory_screen.dart';
import 'package:pscct/screens/landing_page/landing_screen.dart';
import 'package:pscct/screens/procurement/procurement_screen.dart';
import 'package:pscct/screens/settings/settings_screen.dart';
import 'package:pscct/screens/sign_in/sign_in_screen.dart';
import 'package:pscct/screens/warehouse/warehouse_screen.dart';

class AppRouter {
  static const String landingPageRoute = '/Landing';
  static const String homeRoute = '/Home';
  static const String inventoryRoute = '/Inventory';
  static const String warehouseRoute = '/Warehouse';
  static const String procurementRoute = '/Procurement';
  static const String inventoryMaterialServicesRoute =
      '/InventoryMaterialServices';
  static const String newsFeedsRoute = '/NewsFeeds';
  static const String loginRoute = '/Login';
  static const String settingsRoute = '/Settings';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingPageRoute:
        return MaterialPageRoute(builder: (_) => LandingPageScreen());
      case homeRoute:
        int pageIndex = settings.arguments as int;

        return MaterialPageRoute(
            builder: (_) => Home(
                  selectedPageIndex: pageIndex,
                ));
      case inventoryRoute:
        return MaterialPageRoute(
          builder: (_) => InventoryScreen(),
        );

      case warehouseRoute:
        return MaterialPageRoute(builder: (_) => WarehouseScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      case newsFeedsRoute:
        return MaterialPageRoute(builder: (_) => GlobalMarketReportScreen());
      case procurementRoute:
        return MaterialPageRoute(builder: (_) => ProcurementScreen());

      default:
        return MaterialPageRoute(builder: (_) => LandingPageScreen());
    }
  }
}
