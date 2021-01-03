import 'package:co_two/compnents/custom_scaffold.dart';
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
    return CustomScaffold(
      title: "Scan einen Raum",
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: SizedBox(
              width: 300.0,
              height: 300.0,
              child: _scanned.isEmpty
                  ? QrCamera(
                      onError: (context, error) => Text("Error"),
                      qrCodeCallback: (code) async {
                        if (code.contains("http://")) {
                          setState(() {
                            _scanned = code;
                          });
                        }
                      },
                    )
                  : RaisedButton(
                      onPressed: () async {
                        print(_scanned);
                        String response = await http.read(_scanned);
                        if (response.isNotEmpty) {
                          setState(() {
                            _data = response;
                            _scanned = "";
                          });
                        }
                      },
                      child: Text("Get data from $_scanned and scan again..."),
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
              child: Text("Data: $_data"),
            ),
          ),
        )
      ],
    );
  }
}
