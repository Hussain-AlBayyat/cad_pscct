import 'package:flutter/material.dart';
import '../../../models/pscct_alert.dart';
import '../../../shared-widgets/alert.dart';

class InventoryAlerts extends StatelessWidget {
  InventoryAlerts({Key? key}) : super(key: key);

  static final alerts = [
    PSCCTAlert(
        title: "Inventory Stock Out",
        value: 1234,
        target: 1233,
        description:
            "Alert on materials that currently below the safety stock level."),
    PSCCTAlert(
        title: "Overdue Reservation",
        value: 1234,
        target: 1234,
        description:
            "Alert on materials reservations that were ordered and fully committed and ready for withdrawal. Those materials have not been withdrawn for more than 2 months based on the requirement date set in the reservation."),
    PSCCTAlert(
        title: "Potential Slow Moving Items",
        value: 1234,
        target: 1235,
        description:
            "Alert on materials that currently active and potential to be slow moving within the next 6 months."),
    PSCCTAlert(
        title: "Blocked Inventory",
        value: 1234,
        target: 1235,
        description: "Alert on blocked inventory items."),
    PSCCTAlert(
        title: "Returned Inventory",
        value: 1234,
        target: 1235,
        description:
            "The percentage of the total returned materials compared to the consumed materials for the last 12 months period."),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: alerts.length,
      primary: false,
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(color: Colors.grey, height: 1),
      itemBuilder: (BuildContext context, int index) {
        return Alert(
          pscctAlert: PSCCTAlert(
              title: alerts[index].title,
              value: alerts[index].value,
              description: alerts[index].description,
              target: alerts[index].target),
        );
      },
    );
  }
}
