import 'package:co_two/compnents/custom_scaffold.dart';
import 'package:co_two/compnents/graph.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "H2.12",
      subtitle: "Klasse 1a",
      children: [
        Positioned(
          top: 130,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                children: [
                  Card(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width / 1.05,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Row(
                                children: [
                                  Positioned(
                                    top: 1,
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      margin: EdgeInsets.only(right: 15),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.red),
                                    ),
                                  ),
                                  Text(
                                    "CO2",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 90),
                                    child: Text(
                                      "730",
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8),
                                    child: Text(
                                      "ppm",
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 90, bottom: 10),
                                child: LineChartSample2(),
                              ),
                            ],
                          ),
                          // Stack(
                          //   children: [
                          //     Container(
                          //       child: Container(
                          //         height: 100,
                          //         width: MediaQuery.of(context).size.width,
                          //         margin: EdgeInsets.only(right: 15),
                          //         decoration: BoxDecoration(
                          //             borderRadius:
                          //                 BorderRadius.circular(100),
                          //             color: Colors.red),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                      margin: EdgeInsets.all(20),
                    ),
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Card(
                      child: Stack(
                    children: [
                      Container(
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
