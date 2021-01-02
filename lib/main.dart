import 'package:animated_background/animated_background.dart';
import 'package:animated_background/particles.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //       // This call to setState tells the Flutter framework that something has
  //       // changed in this State, which causes it to rerun the build method below
  //       // so that the display can reflect the updated values. If we changed
  //       // _counter without calling setState(), then the build method would not be
  //       // called again, and so nothing would appear to happen.
  //       _counter++;
  //     }

  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xffC0C5CD),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
            color: Colors.white,
          ),
          // Here we take the value from the Home object that was created by

          // the App.build method, and use it to set our appbar title.
          title: Text(
            "Hallo",
            style: Theme.of(context).textTheme.headline1,
          ),
          backgroundColor: Color(0xff677792),
          elevation: 0,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                  title: Text("Home"),
                  onTap: () {
                    // Navigation
                  }),
              ListTile(
                title: Text("Scan"),
                onTap: () {
                  // Navigation to scan page
                },
              ),
              ListTile(
                title: Text("Journal"),
                onTap: () {
                  // Navigation to detail? is this necessary?
                },
              )
            ],
          ),
        ),
        body: Stack(children: [
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(900.5, 60.9)),
                color: Color(0xffC677792),
              ),
            ),
          ),
          Positioned(
            top: 10,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: OutlineButton(
                  onPressed: () {},
                  child: Text(
                    "Mein Raum",
                    // style: Theme.of(context).textTheme.headline5,
                  ),
                  borderSide: BorderSide(color: Colors.white),
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 90.0)),
            ),
          ),
          Positioned(
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
                )),
          )
        ]));
  }
}
