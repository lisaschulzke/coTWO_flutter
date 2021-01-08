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
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              //TODO: Buttongroup
              height: 100,
            ),
            Container(
              child: Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    // width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: Column(
                        children: [
                          // Card(
                          //   child: Container(
                          //     height: MediaQuery.of(context).size.height / 2.09,
                          //     width: MediaQuery.of(context).size.width / 1.05,
                          //     child: Column(
                          //       children: [
                          //         Stack(
                          //           children: [
                          //             ExpansionTile(
                          //               title: Text("CO2"),
                          //               leading: Icon(Icons.circle),
                          //                                                     children: [
                          //                 Row(
                          //                   children: [
                          //                     Container(
                          //                       height: 20,
                          //                       width: 20,
                          //                       // margin: EdgeInsets.only(right: 15),
                          //                       decoration: BoxDecoration(
                          //                           borderRadius:
                          //                               BorderRadius.circular(100),
                          //                           color: Colors.red),
                          //                     ),
                          //                     Text(
                          //                       "CO2",
                          //                       style: TextStyle(
                          //                           color: Theme.of(context)
                          //                               .primaryColor,
                          //                           fontSize: 28,
                          //                           fontWeight: FontWeight.bold),
                          //                     ),
                          //                     Container(
                          //                       margin: EdgeInsets.only(left: 90),
                          //                       child: Text(
                          //                         "730",
                          //                         style: TextStyle(
                          //                             color: Theme.of(context)
                          //                                 .primaryColor,
                          //                             fontSize: 28,
                          //                             fontWeight: FontWeight.bold),
                          //                       ),
                          //                     ),
                          //                     Container(
                          //                       margin: EdgeInsets.only(left: 8),
                          //                       child: Text(
                          //                         "ppm",
                          //                         style: TextStyle(
                          //                             color: Theme.of(context)
                          //                                 .primaryColor,
                          //                             fontSize: 20,
                          //                             fontWeight: FontWeight.bold),
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ],
                          //             ),
                          //             Container(
                          //               margin: EdgeInsets.only(
                          //                   top: 90, bottom: 10),
                          //               child: LineChartSample2(),
                          //             ),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //     margin: EdgeInsets.all(20),
                          //   ),
                          //   elevation: 0,
                          //   color: Colors.white,
                          //   shape: RoundedRectangleBorder(
                          //     side: BorderSide(color: Colors.white70, width: 1),
                          //     borderRadius: BorderRadius.circular(20),
                          //   ),
                          // ),
                          Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ExpansionTile(
                                initiallyExpanded: true,
                                title: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 0),
                                      child: Text(
                                        "CO2",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 30),
                                      child: Text(
                                        "735",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 7, top: 5),
                                      child: Text(
                                        "ppm",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                leading: Icon(
                                  Icons.circle,
                                  color: Colors.green,
                                  size: 23,
                                ),
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height *0.5,
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.only(right: 15),
                                    child: Stack(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 90, bottom: 10),
                                          child: LineChartSample2(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ExpansionTile(
                                title: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 0),
                                      child: Text(
                                        "Temperatur",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 30),
                                      child: Text(
                                        "22,5",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 7, top: 5),
                                      child: Text(
                                        "°C",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                leading: Icon(
                                  Icons.circle,
                                  color: Colors.red,
                                  size: 23,
                                ),
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.only(right: 15),
                                    child: Stack(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 90, bottom: 10),
                                          child: LineChartSample2(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ExpansionTile(
                                title: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 0),
                                      child: Text(
                                        "Luftfeuchtigkeit",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 30),
                                      child: Text(
                                        "53",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 7, top: 5),
                                      child: Text(
                                        "%",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                leading: Icon(
                                  Icons.circle,
                                  color: Colors.red,
                                  size: 23,
                                ),
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.only(right: 15),
                                    child: Stack(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 90, bottom: 10),
                                          child: LineChartSample2(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
