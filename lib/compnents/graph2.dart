import 'package:co_two/models/chart_configuration.dart';
import 'package:co_two/models/sensor.dart';
import 'package:flutter/material.dart';
import 'package:jo_tb_fl_chart/jo_tb_fl_chart.dart';

class Graph2 extends StatelessWidget {
  final DiagramControl control;
  final Sensor sensor;

  Graph2(this.control, this.sensor);



  @override
  Widget build(BuildContext context) {
    return JOTimeBasedSwipingLineChart(
      controller: control.controller, // get time and relevant value from ALL your data
      swapAnimationDuration: const Duration(milliseconds: 250),
      lineColors: [Colors.purple],
      belowChartColors: [Colors.purple[200].withOpacity(0.3)],
      backgroundColor: Colors.white,
      axisColor: Colors.black,
      xAxisTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 9.0),
      yAxisTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12.0),
      yAxisLabelStepSize: control.type == 'CO2' ? 500.0 : control.type == 'Temperatur' ? 5.0 : 10.0,
      showLegend: false, // should display a legend (interval from / to within the diagram
      legendTextStyle: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
    );
  }
}
