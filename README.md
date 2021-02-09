# co_two

Eine Flutter-App, die zur Messung und Visualisierung von CO2-, Temperatur- und Feuchtigkeitssensordaten dient. 


## Initialisieren eines neuen Flutter Projekts

Für den Homescreen wurde zunächst eine eigene Klasse angelegt, auf die später durch Navigieren zugegriffen werden kann.

```class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Hallo",
      subtitle: " ",
      icon: Icon(Icons.menu),
      children: [
        _buildGridView(),
        _buildScanButton(),
      ],
    );
  } 
  ```  
  
 Wie im Code-Beispiel zu sehen, wird zu beginn jeder Klasse der Custom Scaffold aufgerufen, der für die erweiterte App-Bar zuständig ist. Mit der Klasse ```CustomScaffold```müssen auch immer die jeweiligen Parameter ```title```, ```subtitle``` und ```icon``` übergeben werden, sowie auch die children, das den eigentlichen body des Widgets wiedergibt.

## Navigation und Routing

Navigieren ist in Flutter ganz einfach. Da jeder Screen eine eigene Klasse ist, kann diese ganz einfach beim Routing aufgerufen werden.
Hierfür setzt man bei einem Button oder einem Container-Widget einfach die Property ```onPressed: ```. Ein Parameter wird hier nicht übergeben. Es wird lediglich im body der Funktion die Methode ```Navigator.pusch(context, route)```aufgerufen. Die route muss natürlich noch ersetzt werden durch die echte Route zu dem Screen. Dies passiert durch den Standard ```MaterialPageRoute(builder: (context) => Scan()``` natürlich kann für Scan hier jede andere beliebige Page stehen, der Rest war in unserem Kontext immer gleich.

```onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Scan()),
              );
            }, 
```            
            

## Erweiterte App-Bar

Um auf jedem Screen die gleiche erweiterte App-Bar zu nutzen, haben wir diese Komponente als eigene Klasse erstellt. So können wir das Widget einfach dort aufrufen, wo wir es brauchen, ohne den Code immer doppelt schreiben zu müssen.

```Widget _buildElipse(BuildContext context) {
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
  ```
Die Besonderheit der erweiterten App-Bar ist die Ellipse unterhalb der eigentlichen App-Bar. Wie zu lesen ist, wird in der Ellipse auf der subtitle übergeben, der auf jedem Screen individuell übergeben werden kann. So haben wir mehr Platz für subtitles als title und subtitle in einer schmalen App-bar. Außerdem wollten wir uns vom Material Design-Standard lösen und unser eigenes Design aus Figma umsetzen.
```MediaQuery.of(context).size``` ist die gesamte Breite bzw. Höhe des Screens. Durch diese Art der Größenbestimmung, wird das Design responsive und skaliert auf anderen Geräten mit. 

## Aufbau der Raumübersicht

## Animated Background

## Scanpage

## Statemanagement und Mockdaten

## 
