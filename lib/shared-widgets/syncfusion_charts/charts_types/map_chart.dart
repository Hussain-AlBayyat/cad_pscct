import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class Model {
  const Model(this.continent, this.count);

  final String continent;
  final double count;
}

class SyncfusionMapChart extends StatelessWidget {
  SyncfusionMapChart({Key? key}) : super(key: key);
  static final data = <Model>[
    const Model('Asia', 1),
    const Model('Africa', 2),
    const Model('Europe', 3),
    const Model('North America', 4),
    const Model('South America', 5),
    const Model('Australia', 6),
  ];
  final mapSource = MapShapeSource.asset(
    'assets/world_map.json',
    shapeDataField: "continent",
    dataCount: data.length,
    primaryValueMapper: (int index) => data[index].continent,
    bubbleSizeMapper: (int index) => data[index].count,
    dataLabelMapper: (int index) => "${data[index].count}",
  );
  @override
  Widget build(BuildContext context) {
    return SfMaps(layers: <MapLayer>[
      MapShapeLayer(
        source: mapSource,
        showDataLabels: true,
        dataLabelSettings: const MapDataLabelSettings(
            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            overflowMode: MapLabelOverflow.visible),
        loadingBuilder: (BuildContext context) {
          return const SizedBox(
            height: 25,
            width: 25,
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          );
        },
      ),
    ]);
  }
}
