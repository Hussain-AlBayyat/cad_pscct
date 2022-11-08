import 'package:flutter/material.dart';
import '../../../models/pscct_alert.dart';
import '../../../shared-widgets/alert.dart';

class ProcurementAlerts extends StatelessWidget {
  ProcurementAlerts({Key? key}) : super(key: key);
  final alerts = [
    PSCCTAlert(
        title: "Non-Compliant Contractors",
        value: 1234,
        target: 1233,
        description:
            "List of non-complaint contractors in terms of safety, health, government regulations and financial capabilities"),
    PSCCTAlert(
        title: "POs to be Released",
        value: 1234,
        target: 1234,
        description:
            "List of Purchase Orders that need to be actioned for final release."),
    PSCCTAlert(
        title: "Pending SES",
        value: 1234,
        target: 1235,
        description:
            "List of pending Service Entry Sheets (SESs) for more than 10 days."),
    PSCCTAlert(
        title: "Consumed Contract",
        value: 1234,
        target: 1235,
        description: "List of Contracts exceeding 75% of Target."),
    PSCCTAlert(
        title: "Open Version POs",
        value: 1234,
        target: 1235,
        description: "List of Purchase Orders with incomplete version."),
    PSCCTAlert(
        title: "Open Orders With Deleted Requirements",
        value: 1234,
        target: 1233,
        description:
            "List of undelivered Purchase Orders with deleted Purchase Requisition."),
    PSCCTAlert(
        title: "Extensive Procurement Time",
        value: 1234,
        target: 1235,
        description:
            "List of under procurement projects and operations actions that exceed the procurement time KPIs."),
    PSCCTAlert(
        title: "Compliance Review Actions",
        value: 1234,
        target: 1235,
        description:
            "List of services procurement actions where the agreement file compliance review is not completed."),
    PSCCTAlert(
        title: "Near Expiry PAs",
        value: 1234,
        target: 1235,
        description:
            "List of Purchase Agreements that expire within 6 months."),
    PSCCTAlert(
        title: "Emergency PR",
        value: 1234,
        target: 1235,
        description:
            "List of Purchase Requisitions with Emergency priority indicator."),
  ];
  @override
  Widget build(BuildContext context) {
    //PSCCTAlert pscctAlert = PSCCTAlert.fromBWXml(alertXml);

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
    ); /*Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        ...List.generate(
            30,
            (index) => Alert(
                  pscctAlert: pscctAlert,
                )),
      ],
    );*/
  }
}
