// import 'package:co_two/models/chart_configuration.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class Graph extends StatefulWidget {
//   final DiagramControl control;

//   const Graph({Key key, this.control}) : super(key: key);

//   @override
//   _GraphState createState() => _GraphState(control);
// }

// class _GraphState extends State<Graph> {
//   final DiagramControl control;
//   _GraphState(this.control);
//   //colors of the line in the graph
//   List<Color> gradientColors = [
//     const Color(0xff304C90),
//     const Color(0xff81B9BF),
//   ];

//   bool showAvg = false;



//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         AspectRatio(
//           aspectRatio: 1,
//           child: Container(
//             decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(18),
//                 ),
//                 color: Colors.white),
//             child: Padding(
//               padding: const EdgeInsets.only(
//                   right: 1.0, left: 10.0, top: 0, bottom: 0),
//               child: LineChart(
//                 mainData(context, control),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 60,
//           height: 34,
//           child: FlatButton(
//             child: Container(),
//             onPressed: () {
//               setState(() {
//                 showAvg = !showAvg;
//               });
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   LineChartData mainData(BuildContext context, DiagramControl control) {
//     return LineChartData(
//       clipData: FlClipData.all(),
//       gridData: FlGridData(
//         show: false,
//         drawVerticalLine: true,
//         getDrawingHorizontalLine: (value) {
//           return FlLine(
//             color: Colors.grey[300],
//             strokeWidth: 1,
//           );
//         },
//         getDrawingVerticalLine: (value) {
//           return FlLine(
//             color: Colors.grey[300],
//             strokeWidth: 1,
//           );
//         },
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         bottomTitles: SideTitles(
//           showTitles: true,
//           reservedSize: 32,
//           //berechnet anhand der datenpunkten, wie er di epunkte auflisten soll
//           interval: DiagramControl.getEfficientInterval(control),
//           checkToShowTitle: DiagramControl.checkToShowTitle,
//           getTextStyles: (value) => const TextStyle(
//               color: Color(0xff67727d), fontWeight: FontWeight.bold, fontSize: 16),
//           getTitles: (value) => DiagramControl.mapTimeToLabel(control, value),
//           margin: 8,
//         ),
//         leftTitles: SideTitles(
//           showTitles: true,
//           getTextStyles: (value) => const TextStyle(
//             color: Color(0xff67727d),
//             fontWeight: FontWeight.bold,
//             fontSize: 15,
//           ),
//           getTitles: (value) => _mapAxisLabels(control, value),
//           reservedSize: 28,
//           margin: 12,
//         ),
//       ),
//       borderData: FlBorderData(
//           show: true, border: Border.all(color: Colors.grey[300], width: 1)),
//       //Intervall von bis anzeigen, den wert daraus und den wert daraus nehmen um Titel zu generieren
//       minX: control.interval.from.toDouble() ?? 0.0,
//       maxX: control.interval.to.toDouble() ?? 0.0,
//       minY: 350,
//       maxY: 1900,
//       lineBarsData: [
//         LineChartBarData(
//           spots: _mapDataPointsToSpots(control.datapoints),
//           isCurved: true,
//           colors: gradientColors,
//           barWidth: 5,
//           isStrokeCapRound: false,
//           dotData: FlDotData(
//             show: true,
//           ),
//           belowBarData: BarAreaData(
//             show: true,
//             colors:
//                 gradientColors.map((color) => color.withOpacity(0.3)).toList(),
//           ),
//         ),
//       ],
//     );
//   }

//   //defining y-axis labels depending on the type of information
//   String _mapAxisLabels(DiagramControl control, double value) {
//     if (control.type == 'CO2') {
//       if (value % 500 == 0) return value.toInt().toString();
//       return '';
//     }
//     if (control.type == 'Temperatur') {
//       if (value % 5 == 0) return value.toInt().toString();
//       return '';
//     }
//     if (control.type == 'Feuchtigkeit') {
//       if (value % 10 == 0) return value.toInt().toString();
//       return '';
//     }
//     return '';
//   }

//   //pushing all datapoints to the matching value in a list (with x and y coordinates)
//   List<FlSpot> _mapDataPointsToSpots(List<DataPoint> datapoints) {
//     return datapoints
//         .map((d) => FlSpot(d.time.toDouble(), d.value.toDouble()))
//         .toList();
//   }
// }
