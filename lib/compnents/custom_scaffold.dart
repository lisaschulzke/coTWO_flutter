import 'package:co_two/main.dart';
import 'package:co_two/scan.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //self defined properties to customize customScaffold widget
  final List<Widget> children; // which content is displayed
  final String title;
  final String subtitle;
  final Icon icon; //what's the name decides on which Icon is illustrated and where it navigates to

//constructor takes values of properties (e.g. this.title) and puts it into variable (e.g. title)
//cunstructor only necessary if i want to give individual information by having a global component
  CustomScaffold(
      {Key key,
      @required this.children,
      @required this.title,
      this.subtitle,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //is only valid in the build function, and is later used in the stack widget --> property children receives variable stackChildren
    List<Widget> stackChildren = [];

    // stackchildren contains elipse, because this is what i want to have in every screen
    stackChildren.add(_buildElipse(context));

    this.children.forEach((child) {
      stackChildren.add(child);
    });

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffC0C5CD),
      appBar: AppBar(
        leading: IconButton(
          icon: this.icon,
          onPressed: () {
            //for better navigation, only open drawer when icon is menu icon. 
            //otherwise just go back to home screen 
            if (this.icon == Icon(Icons.menu)) {
              print('_______________________');
              print(this.icon);
              _scaffoldKey.currentState.openDrawer();
            } else {
              print('_______________________');
              print(this.icon);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            }
          },
          color: Colors.white,
        ),
        title: Text(
          this.title,
          style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: Color(0xff192360),
        elevation: 0,
      ),
      //defining content for drawer
      drawer: Drawer(
        child: Container(
          color: Color(0xff192360),
          child: ListView(
            children: [
              ListTile(
                  title: Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  }),
              ListTile(
                title: Text(
                  "Scan",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Scan()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      //body depends on individual content of the page, all saved in the stackchildren
      //this has to be set as a property to give the body
      body: Stack(
        children: stackChildren,
      ),
    );
  }
  //because the 'appbar' should look a little different to the default version, I added an ellipse here
  Widget _buildElipse(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        child: Text(
          this.subtitle,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        padding: EdgeInsets.only(left: 75),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(MediaQuery.of(context).size.width, 60)),
          color: Color(0xff192360),
        ),
      ),
    );
  }
}
