import 'package:co_two/compnents/custom_scaffold.dart';
import 'package:co_two/compnents/empty_screen.dart';
import 'package:co_two/compnents/graph.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  List<bool> _selections = List.generate(3, (_) => false);
  bool _active = false;
  int _index = 0;

  void _toggleActiveState(int index) {
    print(_active);
    print(index);

    setState(() {
      if (index == 1 || index == 2) {
        _active = true;
      } else {
        _active = false;
      }
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_active);
    return CustomScaffold(
      title: "H2.12",
      subtitle: "Klasse 1a",
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 40, bottom: 20),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: ToggleSwitch(
                  minWidth: 200,
                  fontSize: 18,
                  inactiveFgColor: Theme.of(context).primaryColor,
                  cornerRadius: 20,
                  initialLabelIndex: _index,
                  labels: ["Heute", "Woche", "Monat"],
                  activeBgColor: Color(0xff81B9BF),
                  inactiveBgColor: Colors.white,
                  onToggle: _toggleActiveState,
                ),
              ),
            ),
            Container(
              child: Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: (_active
                        ? Container(
                            height: 200,
                            width: 200,
                            color: Colors.white,
                            child: Text(
                                "Noch nicht genug Daten gesammelt für diese Ansicht ;)", style: TextStyle(fontSize: 16,
                                color: Theme.of(context).primaryColor),),
                          )
                        : Center(
                            child: Column(
                              children: [
                                Card(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ExpansionTile(
                                      initiallyExpanded: true,
                                      title: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 0),
                                            child: Text(
                                              "CO2",
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
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
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 7, top: 5),
                                            child: Text(
                                              "ppm",
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.5,
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ExpansionTile(
                                      title: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 0),
                                            child: Text(
                                              "Temperatur",
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
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
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 7, top: 5),
                                            child: Text(
                                              "°C",
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ExpansionTile(
                                      title: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 0),
                                            child: Text(
                                              "Luftfeuchtigkeit",
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
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
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 7, top: 5),
                                            child: Text(
                                              "%",
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          width:
                                              MediaQuery.of(context).size.width,
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
                          )),
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
