import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:co_two/compnents/custom_scaffold.dart';

import 'package:co_two/compnents/graph.dart';
import 'package:co_two/models/bloc.dart';

import 'package:co_two/models/chart_configuration.dart';
import 'package:co_two/models/sensor.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:toggle_switch/toggle_switch.dart';

class Detail extends StatefulWidget {
  final String id;
  final Sensor oneRoomData;

//constructor
  const Detail({Key key, this.oneRoomData, this.id}) : super(key: key);

  @override
  _DetailState createState() => _DetailState(oneRoomData.id);
}

class _DetailState extends State<Detail> {
  final String id;
  Sensor sensor;
  DiagramOptions options;

  _DetailState(this.id);

  List<bool> _selections = List.generate(3, (_) => false);
  bool _active = false;
  int _index = 0;

  //method for toggle button which changes state due to index
  void _toggleActiveState(int index) {
    print(_active);
    print(index);
    setState(() {
      // if (index == 1 || index == 2) {
      //   _active = true;
      // } else {
      //   _active = false;
      // }
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    DiagramOptions options;
    print(_active);
    //Stream Builder used for refreshing data continiously
    return StreamBuilder<Sensor>(
      stream: querySensor(id),
      builder: (BuildContext context, AsyncSnapshot<Sensor> snapshot) {
        //if data is not available, show progress indicator (loading data)
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        //giving sensor data for rendering all information
        sensor = Sensor(snapshot.data.id, snapshot.data.name, snapshot.data.description, snapshot.data.comment, snapshot.data.measurements);
        bloc.getInitialOptions(id, sensor);
        return StreamBuilder<DiagramOptions>(
          stream: bloc.options,
          builder: (BuildContext context, AsyncSnapshot<DiagramOptions> optionsSnapshot) {
            if (!snapshot.hasData) return Center(child: Text('Keine Diagrammoptionen gefunden.'));
            options = optionsSnapshot.data;
            //scaffold with ellipse is given back to have the same scaffold design on every screen
            return CustomScaffold(
              title: sensor.name,
              subtitle: sensor.description,
              icon: Icon(Icons.arrow_back),
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
                          activeBgColor: Color(0xffD925A9),
                          inactiveBgColor: Colors.white,
                          onToggle: _toggleActiveState,
                        ),
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            child: (_index == 1 || _index == 2
                                ? Container(
                              height:
                              MediaQuery.of(context).size.height * 0.75,
                              width: 150,
                              child: Center(
                                child: Card(
                                  margin:
                                  EdgeInsets.only(left: 20, right: 20),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      Container(
                                          child: Image.asset(
                                            'assets/images/data_blue.png',
                                            height: 400,
                                            width: 400,
                                          )),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 45, right: 45),
                                        child: Text(
                                          "Du hast noch nicht genügend Daten gesammelt für diese Ansicht.",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              // Text(
                              //   "Noch nicht genug Daten gesammelt für diese Ansicht ;)",
                              //   style: TextStyle(
                              //       fontSize: 16,
                              //       color: Theme.of(context).primaryColor),
                              // ),
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
                                              margin:
                                              EdgeInsets.only(left: 0),
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
                                              margin:
                                              EdgeInsets.only(left: 30),
                                              child: Text(
                                                // to string necessary because it is a text widget and it always needs to be a string
                                                // and int is not a string so it has to be converted to a string to make it visible in text widget
                                                '${sensor.measurements.length > 0 ? sensor.measurements[sensor.measurements.length - 1].co2 : 0}',
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
                                          color: getCo2Color(),
                                          size: 23,
                                        ),
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height *
                                                0.5,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin:
                                            EdgeInsets.only(right: 15),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 20, bottom: 10, left: 8, right: 10),
                                                  child: Graph(
                                                      control: options
                                                          .diagrams[0]),
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
                                              margin:
                                              EdgeInsets.only(left: 0),
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
                                              margin:
                                              EdgeInsets.only(left: 30),
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
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin:
                                            EdgeInsets.only(right: 15),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 90, bottom: 10),
                                                  child: Graph(
                                                      control: options
                                                          .diagrams[2]),
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
                                              margin:
                                              EdgeInsets.only(left: 0),
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
                                              margin:
                                              EdgeInsets.only(left: 30),
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
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin:
                                            EdgeInsets.only(right: 15),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 90, bottom: 10),
                                                  child: Graph(
                                                      control: options
                                                          .diagrams[2]),
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
          },
        );
      },
    );
  }

  //collecting data from firebase backend listed by descending time
  Stream<Sensor> querySensor(String id) {
    return FirebaseFirestore.instance
        .collection('sensordata')
        .doc('$id')
        .get()
        .then((sensor) {
      return sensor.reference
          .collection('measurements')
          .orderBy('time', descending: true)
          .get()
          .then((measurements) {
            
        List<SensorMeasurement> ms = <SensorMeasurement>[];
        measurements.docs.forEach((element) {
          final m = SensorMeasurement.fromJSON(element.data());
          ms.add(m);
        });
        return Sensor(id, sensor.data()['name'] ?? '', sensor.data()['description'] ?? '', sensor.data()['comment'] ?? '', ms);
      });
    }).asStream();
  }

//defining the color of the dot to indicate if status is good=green
//ok=yellow or bad=pink
  Color getCo2Color() {
    final value = sensor.measurements.length > 0
        ? sensor.measurements[sensor.measurements.length - 1].co2
        : 0;
    return value > 1500
        ? Colors.red
        : (value > 900 ? Colors.yellow : Colors.green);
  }
}
