import 'package:flutter/material.dart';
import 'package:pscct/models/dialog_controller.dart';
import 'package:pscct/models/pscct_report.dart';
import 'package:pscct/shared-widgets/custom_card.dart';
import 'package:pscct/size_config.dart';

import '../models/assets.dart';
import '../models/enums/echart_configurator.dart';
import '../screens/inventory/widgets/inventory_trend.dart';
import '../screens/inventory/widgets/outsourced_inventory.dart';
import '../screens/inventory/widgets/upcoming_purchase_order.dart';
import '../screens/procurement/widgets/egrs_processing_time.dart';
import '../screens/procurement/widgets/iktva.dart';
import '../screens/procurement/widgets/lost_opportunity.dart';
import '../screens/procurement/widgets/low_value_procurement.dart';
import '../screens/procurement/widgets/materials.dart';
import '../screens/procurement/widgets/ses_processing_time.dart';
import '../screens/procurement/widgets/spend_by_country.dart';
import '../screens/warehouse/widgets/co2_emission_target2.dart';
import '../screens/warehouse/widgets/pending_goods_receipt.dart';
import '../screens/warehouse/widgets/shipping_price_index.dart';
import 'echarts/echart.dart';
import 'file_viewer.dart';

class ReportButton extends StatelessWidget {
  const ReportButton({required this.pscctReport, Key? key}) : super(key: key);
  final PSCCTReport pscctReport;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(165),
      height: getProportionateScreenHeight(130),
      child: CustomCard(
        color: Theme.of(context).cardColor,
        child: TextButton(
            style: ElevatedButton.styleFrom(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
            ),
            onPressed: () {
              DialogController.showPopup(
                  pscctReport.Title, pscctReport.Description, context,
                  dialogBody:
                      mapWidgets(pscctReport.ComponentKey, pscctReport));
              /*showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  builder: (context) {
                    return Report(
                      title: buttonText,
                      body: bottomSheetWidget,
                    );
                  });*/
            }, //=> onButtonPress!(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(16),
                ),
                Image.asset(
                  pscctReport.ChartType == "Table"
                      ? Assets.tableListIcon
                      : pscctReport.ChartType == "Line"
                          ? Assets.trendIcon
                          : pscctReport.ChartType == "Pie"
                              ? Assets.pieIcon
                              : Assets.columnChartIcon,
                  width: getProportionateScreenHeight(32),
                  height: getProportionateScreenHeight(32),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: pscctReport.Title,
                      child: Text(
                        pscctReport.Title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).highlightColor,
                            fontSize: getProportionateScreenHeight(16)),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  mapWidgets(String id, PSCCTReport report) {
    List<Map> data = report.RawData;
    data.forEach((element) {
      element.forEach((key, value) {
        try {
          // format the current value decimal digits and then update the data
          var formattedNumber = double.parse(value)
              .toStringAsFixed(int.parse(report.DecimalDigits));
          element.update(key, (value) => formattedNumber);
        } catch (error) {
          // value is not a number
        }
      });
    });

    if (report.ImageKey.isNotEmpty) {
      //data is an image or pdf file
      return FileViewer(file_key: pscctReport.ImageKey);
    } else if (report.IsGeneric) {
      if (report.ChartType == "Table") {
        return Materials(data: data);
      } else if (report.ChartType == "Line") {
        return EChartCharts(
          data: data,
          name: report.Title,
          configurations: [EChartConfigurator(chartType: ChartType.line)],
        );
      } else if (report.ChartType == "Bar") {
        return EChartCharts(
          data: data,
          name: report.Title,
          configurations: [EChartConfigurator(chartType: ChartType.bar)],
        );
      } else if (report.ChartType == "Pie") {
        return EChartCharts(
          data: data,
          name: report.Title,
          showAxis: false,
          configurations: [
            EChartConfigurator(chartType: ChartType.pie, showLabel: true)
          ],
        );
      } else {
        return Container(
          child: Text(
            "Widget is not built",
            style: TextStyle(color: Colors.red),
          ),
        );
      }
    } else {
      id = id.toUpperCase();

      switch (id) {
        //Procurement
        case "IKTVA":
          return IKTVA(
            data: data,
          );
        case "CO2EMISSIONTARGET":
          return Co2EmissionTarget(
            data: data,
          );
        case "PROCESSINGTIMEFORSES":
          return SESProcessingTime(
            data: data,
          );
        case "PROCESSINGTIMEFOREGR":
          return EGRSProcessingTime(
            data: data,
          );

        case "LOSTOPPORTUNITY":
          return LostOpportunity(
            data: data,
          );
        case "INDIRECTMATERIALSPENDBYCATEGORY":
          return Materials(data: data);
        case "COUNTRYSPEND":
          return SpendByCountry(data: data);
        case "LOWVALUEPROC":
          return LowValueProcurement(
            data: data,
          );
        //Warehouse & Logistics
        case "SHIPPINGPRICEINDEX":
          return ShippingPriceIndex(
            data: data,
          );
        case "PENDINGGR":
          return PendingGoodsReceipt(
            data: data,
          );

        //Inventory
        case "INVENTORYTRENDCHART":
          return InventoryTrend(
            data: data,
          );
        case "OUTSOURCEDINVENTORY":
          return OutsourcedInventory(
            data: data,
          );
        case "UPCOMINGPO":
          return UpcomingPurchaseOrder(
            data: data,
          );
        default:
          return Container(
            child: Text(
              "Widget is not built",
              style: TextStyle(color: Colors.red),
            ),
          );
      }
    }
  }
}
