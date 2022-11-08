import 'package:flutter/material.dart';

import '../../../models/pscct_alert.dart';
import '../../../shared-widgets/alert.dart';

class WarehouseLogisticsAlerts extends StatelessWidget {
  const WarehouseLogisticsAlerts({Key? key}) : super(key: key);

  static final alerts = [
    PSCCTAlert(
        title: "Emergency Items Without POD",
        value: 1234,
        target: 1233,
        description:
            "List of priority Hot Taxi or Emergency items without Proof of Delivery (POD)."),
    PSCCTAlert(
        title: "IK upcoming Bulky Delivery",
        value: 1234,
        target: 1234,
        description:
            "List of In-Kingdom (IK) items identified as bulky by size or volume."),
    PSCCTAlert(
        title: "Near Expiry Shelflife",
        value: 1234,
        target: 1235,
        description:
            "List of shelf-life materials which are going to expire within the upcoming 6 months."),
    PSCCTAlert(
        title: "OOK upcoming bulky delivery",
        value: 1234,
        target: 1235,
        description:
            "List of Out-of-Kingdom (OOK) shipments for items identified as bulky by size or volume."),
    PSCCTAlert(
        title: "Unconfirmed TOs",
        value: 1234,
        target: 1235,
        description:
            "List of Unconfirmed transfer orders within the allocated cycle time duration period."),
    PSCCTAlert(
        title: "FCN for WH Items",
        value: 1234,
        target: 1233,
        description:
            "List of Failed Collection Notice (FCN) for items to be collected from Warehouse (WH)."),
    PSCCTAlert(
        title: "Pending Stock Adjustment",
        value: 1234,
        target: 1235,
        description:
            "List of all Materials under Stock Adjustment \"Lost & Found\""),
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
              description: alerts[index].description,
              value: alerts[index].value,
              target: alerts[index].target),
        );
      },
    );
  }
}
