import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:co_two/compnents/custom_scaffold.dart';
import 'package:co_two/detail.dart';
import 'package:co_two/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import 'package:http/http.dart' as http;

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  String _scanned = "";
  String _data = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScaffold(
        icon: Icon(Icons.arrow_back),
        title: "KUB scannen",
        subtitle: '''Scanne einen QR-Code um einen 
neuen Raum hinzuzufügen.''',
        children: [
          Positioned(
            top: 130,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 8.0, color: const Color(0xFFFFFFFF)),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          width: 300.0,
                          height: 300.0,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: _scanned.isEmpty
                                  ? QrCamera(
                                      fit: BoxFit.cover,
                                      onError: (context, error) =>
                                          Text("Error"),
                                      qrCodeCallback: (code) async {
                                        // if (code.contains("http://")) {
                                        setState(() {
                                          _scanned = code;
                                          print('#############');
                                          print(_scanned);
                                          print('##############');
                                        });
                                        // }
                                        if (_scanned != null) {
                                          createSensorId(_scanned);
                                          Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Home(),
                                      ),
                                    );
                                        }
                                      },
                                    )
                                  //this button is to prevent the camera from throwing an error (because once
                                  //the camera is open, the library does not shut down the camera on its own)
                                  // : Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => Home(),
                                  //     ),
                                  //   )

                              : RaisedButton(
                                  onPressed: () async {
                                    print(_scanned);
                                    //methode hinzufügen, die auf firebase den raum dem nutzer zufügt
                                  },
                                  child: Text(
                                      "Get data from $_scanned and scan again..."),
                                ),
                              )),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30, left: 55, right: 45),
                      child: Text(
                        "Platziere das Scanfenster über einem QR-Code um ihn zu scannen.",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 25),
                      child: Image.asset(
                        'assets/images/qr_code_pink.png',
                        height: 150,
                        width: 150,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(32),
              child: Center(
                child: Text(_data),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> createSensorId(String sensorId) async {
    final createdAt = Timestamp.fromMillisecondsSinceEpoch(
        DateTime.now().millisecondsSinceEpoch);
    return FirebaseFirestore.instance
        .collection('sensors_users')
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser.uid)
        .where('sensorId', isEqualTo: sensorId)
        .limit(1)
        .get()
        .then((value) async {
      if (value.size == 0) {
        final ref =
            await FirebaseFirestore.instance.collection('sensors_users').add({
          'userId': FirebaseAuth.instance.currentUser.uid,
          'sensorId': sensorId,
          'createdAt': createdAt
        });
        return ref;
      } else {
        // update createdAt if sensor is scanned again to get it in top position.
        //ersetzt neuen wert durch created at
        final ref = value.docs.first.reference;
        final batch = FirebaseFirestore.instance.batch();
        batch.set(ref, {
          'userId': FirebaseAuth.instance.currentUser.uid,
          'sensorId': sensorId,
          'createdAt': createdAt
        });
        return batch.commit();
      }
    });
  }
}
