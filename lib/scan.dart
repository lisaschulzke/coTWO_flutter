import 'package:co_two/compnents/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:qr_mobile_vision/qr_camera.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  String _scanned = "";
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
              height: 600.0,
              child: _scanned.isEmpty
                  ? QrCamera(
                      qrCodeCallback: (code) {
                        setState(() {
                          _scanned = code;
                        });
                      },
                    )
                  : Text(_scanned),
            ),
          ),
        )
      ],
    );
  }
}
