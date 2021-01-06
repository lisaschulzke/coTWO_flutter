import 'package:animated_background/animated_background.dart';
import 'package:animated_background/particles.dart';
import 'package:co_two/compnents/custom_scaffold.dart';
import 'package:co_two/scan.dart';
import 'package:flutter/material.dart';

void main() {
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

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Hallo",
      children: [
        _buildGridView(),
        _buildScanButton(),
      ],
    );
  }

  Widget _buildGridView() {
    return Positioned(
      top: 90,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          padding: EdgeInsets.all(10),
          children: [
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: AnimatedBackground(
                  behaviour: RandomParticleBehaviour(
                    options: ParticleOptions(
                      particleCount: 500,
                      spawnMinSpeed: 1.2,
                      spawnMaxSpeed: 5.5,
                      baseColor: Color(0xff81B9BF),
                      minOpacity: 0.1,
                      maxOpacity: 0.9,
                    ),
                  ),
                  vsync: this,
                  child: Container(),
                ),
              ),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            //Card pattern for extracting component
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: AnimatedBackground(
                  behaviour: RandomParticleBehaviour(
                    options: ParticleOptions(
                      //TODO: make the count dynamic
                      particleCount: 100,
                      spawnMinSpeed: 1.2,
                      spawnMaxSpeed: 5.5,
                      baseColor: Color(0xff81B9BF),
                      minOpacity: 0.1,
                      maxOpacity: 0.9,
                    ),
                  ),
                  vsync: this,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Stack(children: [
                        Positioned(
                          // top: 20,
                          child: Container(
                              child: Row(children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10.0),
                                  height: 17,
                                  width: 17,
                                  //TODO: make color dynamic with ppm value
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.yellowAccent[100]),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "H 2.12",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text("Klasse 1a",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12))
                                  ],
                                ),
                              ]),
                              padding: EdgeInsets.all(7),
                              margin: EdgeInsets.only(left: 20.0, right: 0.0),
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor,
                              )),
                        ),
                      ])
                    ],
                  ),
                ),
              ),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: AnimatedBackground(
                  behaviour: RandomParticleBehaviour(
                    options: ParticleOptions(
                      particleCount: 50,
                      spawnMinSpeed: 1.2,
                      spawnMaxSpeed: 5.5,
                      baseColor: Color(0xff81B9BF),
                      minOpacity: 0.1,
                      maxOpacity: 0.9,
                    ),
                  ),
                  vsync: this,
                  child: Container(),
                ),
              ),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: AnimatedBackground(
                  behaviour: RandomParticleBehaviour(
                    options: ParticleOptions(
                      particleCount: 200,
                      spawnMinSpeed: 1.2,
                      spawnMaxSpeed: 5.5,
                      baseColor: Color(0xff81B9BF),
                      minOpacity: 0.1,
                      maxOpacity: 0.9,
                    ),
                  ),
                  vsync: this,
                  child: Container(),
                ),
              ),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: AnimatedBackground(
                  behaviour: RandomParticleBehaviour(
                    options: ParticleOptions(
                      particleCount: 75,
                      spawnMinSpeed: 1.2,
                      spawnMaxSpeed: 5.5,
                      baseColor: Color(0xff81B9BF),
                      minOpacity: 0.1,
                      maxOpacity: 0.9,
                    ),
                  ),
                  vsync: this,
                  child: Container(),
                ),
              ),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: AnimatedBackground(
                  behaviour: RandomParticleBehaviour(
                    options: ParticleOptions(
                      particleCount: 40,
                      spawnMinSpeed: 1.2,
                      spawnMaxSpeed: 5.5,
                      baseColor: Color(0xff81B9BF),
                      minOpacity: 0.1,
                      maxOpacity: 0.9,
                    ),
                  ),
                  vsync: this,
                  child: Container(),
                ),
              ),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScanButton() {
    return Positioned(
      top: 10,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: OutlineButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Scan()),
              );
            },
            child: Text(
              "Mein Raum",
              style: TextStyle(fontSize: 18),
              // style: Theme.of(context).textTheme.headline5,
            ),
            borderSide: BorderSide(color: Colors.white),
            textColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 150.0, vertical: 15.0)),
      ),
    );
  }
}
