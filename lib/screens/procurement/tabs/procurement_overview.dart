import 'package:flutter/material.dart';
import 'package:pscct/helper.dart';
import 'package:pscct/models/assets.dart';
import 'package:pscct/screens/procurement/widgets/egrs_processing_time.dart';
import 'package:pscct/screens/procurement/widgets/iktva.dart';
import 'package:pscct/screens/procurement/widgets/lost_opportunity.dart';
import 'package:pscct/screens/procurement/widgets/low_value_procurement.dart';
import 'package:pscct/screens/procurement/widgets/spend_by_country.dart';

import '../../../shared-widgets/overview.dart';

import '../widgets/materials.dart';
import '../widgets/ses_processing_time.dart';

class ProcurementOverview extends StatelessWidget {
  ProcurementOverview({Key? key}) : super(key: key);

  final titles = ["Total Spend", "Contract Spend", "Materials Spend"];
  final List<Map> widgets = [
    {
      "title": "IKTVA",
      "widget": IKTVA(),
      "icon": Assets.trendIcon,
      "description":
          "This section shows the company IKTVA Scores for each quarter."
    },
    {
      "title": "SES Processing Time (Days)",
      "widget": SESProcessingTime(),
      "icon": Assets.trendIcon,
      "description":
          "This chart shows Service Entry Sheet (SES) submission and approval processing time."
    },
    {
      "title": "EGRS Processing Time (Days)",
      "widget": EGRSProcessingTime(),
      "icon": Assets.trendIcon,
      "description":
          "This chart shows Electronic Goods Receipts (e-GRs) processing time."
    },
    {
      "title": "Lost Opportunity",
      "widget": LostOpportunity(),
      "icon": Assets.trendIcon,
      "description":
          "This sections shows lost opportunities for local manufacturers for orders released OOK."
    },
    {
      "title": "Commodity Spend",
      "widget": Materials(),
      "icon": Assets.tableListIcon,
      "description":
          "This section shows the top commodities based on spend for the last 12 months."
    },
    {
      "title": "Spend By Country",
      "widget": SpendByCountry(),
      "icon": Assets.tableListIcon,
      "description":
          "This section shows the top five (5) countries based on material spend for the last 12 months."
    },
    {
      "title": "Low Value Procurement - RPA",
      "widget": LowValueProcurement(),
      "icon": Assets.tableListIcon,
      "description":
          "This section shows the top five (5) countries based on material spend for the last 12 months."
    },
  ];
  final List<List<Map<String, dynamic>>> convertedData = [];
  @override
  Widget build(BuildContext context) {
    return Overview(
      widgets: widgets,
      titles: titles,
    );
  }
}
