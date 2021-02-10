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
      lineColors: [Color(0xff304C90)],
      belowChartColors: [Color(0xff304C90).withOpacity(0.3)],
      backgroundColor: Colors.white,
      axisColor: Colors.black,
      xAxisTextStyle: TextStyle(color: Color(0xff677792), fontWeight: FontWeight.bold, fontSize: 9.0),
      yAxisTextStyle: TextStyle(color: Color(0xff677792), fontWeight: FontWeight.bold, fontSize: 12.0),
      yAxisLabelStepSize: control.type == 'CO2' ? 500.0 : control.type == 'Temperatur' ? 5.0 : 10.0,
      showLegend: true, // should display a legend (interval from / to within the diagram
      legendTextStyle: TextStyle(color: Color(0xff677792), fontSize: 10, fontWeight: FontWeight.bold),
    );
  }
}
