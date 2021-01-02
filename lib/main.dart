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
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light),
      home: Home(title: 'Flutter Demo Home Page'),
    );
  }
}

class Home extends StatefulWidget {
  Home({
    Key key,
    this.title
  }): super(key: key);

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

class _HomeState extends State < Home > {
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
      appBar: AppBar(
        // Here we take the value from the Home object that was created by

        // the App.build method, and use it to set our appbar title.
        title: Text("Hallo."),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print("clicked!");
            })
        ],
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
                // Navigatiopn to detail? is this necessary?
              },
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              height: 50,
              width: 50,
            ),
          ),
        ],
      ));
  }
}