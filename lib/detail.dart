import 'package:co_two/compnents/custom_scaffold.dart';
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
            height: MediaQuery.of(context).size.height/1.9,
            child: Center(
              child: Container(
                  child: Card(
                    child: Container(
                      
                    ),
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
