import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:co_two/compnents/custom_card.dart';
import 'package:co_two/compnents/custom_scaffold.dart';
import 'package:co_two/models/sensor.dart';
import 'package:co_two/scan.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: 'admin@test.com', password: 'test123');

  FirebaseFirestore.instance.collection('sensordata').get().then((value) => {
        value.docs.forEach((element) {
          print(element.data());
        }),
      });

  FirebaseFirestore.instance
      .collection('sensordata')
      .doc('00FAA2624C0846ED')
      .get()
      .then((sensor) {
    return sensor.reference
        .collection('measurements')
        .orderBy('time', descending: true)
        .get()
        .then((measurements) {
      List<SensorMeasurement> ms = <SensorMeasurement>[];
      measurements.docs.forEach((element) {
        print(element);
        final m = SensorMeasurement.fromJSON(element.data());
        ms.add(m);
      });
    });
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          primarySwatch: Colors.blue,
          primaryColor: Color(0xff677792),
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
            buttonColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.light),
      home: Home(title: 'Flutter Demo Home Page'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Hallo",
      subtitle: " ",
      children: [
        _buildGridView(),
        _buildScanButton(),
      ],
    );
  }

  Widget _buildGridView() {
    print(FirebaseAuth.instance.currentUser);
    return Positioned(
      top: 90,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // Consumer ruft diesen einen Change Notifier auf, und erlaubt Datenzugriff auf StateControl
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('sensors_users')
              .where('userId', isEqualTo: FirebaseAuth.instance.currentUser.uid)
              .orderBy('createdAt', descending: true)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return Text('Keine Daten verfügbar.');
            if (snapshot.data.size == 0) return Text('Liste ist leer');
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: snapshot.data.size,
              padding: EdgeInsets.all(10),
              itemBuilder: (BuildContext context, int index) {
                final id = snapshot.data.docs[index]['sensorId'];
                return StreamBuilder<Sensor>(
                  stream: querySensor(id),
                  builder: (BuildContext context,
                      AsyncSnapshot<Sensor> snapshot) {
                    if (!snapshot.hasData)
                      return Text('Keine Daten verfügbar für Sensor $id');
                    if (snapshot.data == null)
                      return Text('Keine Daten verfügbar.');
                    final sensor = Sensor(snapshot.data.id, snapshot.data.name, snapshot.data.description, snapshot.data.comment, snapshot.data.measurements);
                    return CustomCard(
                      particleCount: (sensor.measurements.length > 0
                              ? sensor
                                  .measurements[sensor.measurements.length - 1]
                                  .co2
                              : 0) *
                          0.25.round(),
                      room: sensor,
                      color: Colors.greenAccent,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildScanButton() {
    return Positioned(
      top: 10,
      width: MediaQuery.of(context).size.width,
      child: Center(
          child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: FlatButton(
            height: 40,
            color: Color(0xffD925A9),
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Color(0xffA62182),
                    width: 1,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Scan()),
              );
            },
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      "KUB scannen",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
            )),
      )
          // OutlineButton.icon(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => Scan()),
          //       );
          //     },
          //     label: Text("Alfred scannen", style: TextStyle(fontSize: 18),),
          //     icon: Icon(Icons.camera_alt_rounded),
          //     borderSide: BorderSide(color: Colors.white),
          //     textColor: Colors.white,
          //     padding: EdgeInsets.symmetric(horizontal: 120.0, vertical: 10.0)),
          ),
    );
  }

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
}
