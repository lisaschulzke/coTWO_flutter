import 'package:animated_background/animated_background.dart';
import 'package:animated_background/particles.dart';
import 'package:co_two/compnents/custom_scaffold.dart';
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
          primaryColor: Colors.amberAccent,
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
            onPressed: () {},
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
