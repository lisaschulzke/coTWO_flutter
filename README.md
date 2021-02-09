# co_two

## Allgemeine Informationen

Eine Flutter-App, die zur Messung und Visualisierung von CO2-, Temperatur- und Feuchtigkeitssensordaten dient. 

Der aktuelle Frontend-Code befindet sich auf dem Branch 'firebase'.

Der zugehörige Backend-Code liegt in diesem Repo: https://github.com/lisaschulzke/coTWO_backend

Der Frontend-Code ohne Firebase (100% meine alleinige Arbeit) befindet sich auf diesem Repo: https://github.com/lisaschulzke/coTwo-local


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

Für die Ansicht der Räume auf dem Homescreen habenw wir jeweils verschiedene Kacheln. Diese sind in einem Grid angelegt, was es einfacher und dynamischer macht, Räume hinzuzufügen ohne großen Code-Aufwand bzgl. des Layouts. Dies machen wir durch einen Gridview builder, der das Grid aufbaut. Bereits zuvor wurden die Daten von Firebase geholt und der Klasse Sensor übergeben. So können später in der custom card die Sensordaten benutzt werden, um bspw. den particle count zu bestimmen.

Das Objekt Sensor verfügt, wie unten zu sehen, über mehrere Eigenschaften, wie beispielsweise ```snapshot.data.name``` um in diesem Fall den Namen des Raums zu übergeben.

```return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: snapshot.data.size,
              padding: EdgeInsets.all(10),
              itemBuilder: (BuildContext context, int index) {
                final id = snapshot.data.docs[index]['sensorId'];
                return StreamBuilder<Sensor>(
                  stream: querySensor(id),
                  builder:
                      (BuildContext context, AsyncSnapshot<Sensor> snapshot) {
                    if (!snapshot.hasData)
                      return Container(
                          child: Text(
                        'Keine Daten verfügbar für Sensor $id',
                        style: TextStyle(color: Colors.white),
                      ));
                    if (snapshot.data == null)
                      return Text('Keine Daten verfügbar.');
                    final sensor = Sensor(
                        snapshot.data.id,
                        snapshot.data.name,
                        snapshot.data.description,
                        snapshot.data.comment,
                        snapshot.data.measurements);
                    return CustomCard(
                      particleCount: (sensor.measurements.length > 0
                              ? sensor
                                  .measurements[sensor.measurements.length - 1]
                                  .co2
                              : 0) *
                          0.25.round(),
                      room: sensor,
                      color: Colors.greenAccent,
                    );
                  },
                );
              },
            );
```

Um später dann die Card dynamisch an den jeweiligen Raum und die dazugehörigen Sensordaten anzupassen, übergeben wir die Daten im Code für den jeweiligen, gescannten Raum. Hier ein Beispiel zum Anpassen der Farbe des Statuskreises. Hier steckt die Logik drin, wann er bei welchen Werten die verschiedenen Farben annimmt.

```
decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: (((room.measurements.length > 0
                                            ? room
                                                .measurements[
                                                    room.measurements.length -
                                                        1]
                                                .co2
                                            : 0) <=
                                        800)
                                    ? Colors.green
                                    : ((room.measurements.length > 0
                                                ? room
                                                    .measurements[room
                                                            .measurements
                                                            .length -
                                                        1]
                                                    .co2
                                                : 0) >
                                            1200)
                                        ? Colors.yellow
                                        : Color(0xffD925A9)),
                              ),
```


#### Custom Card

Die Custom Card ist die einzelne Kachel in der Raumübersicht des GridBuilders. Diese Klasse haben wir wieder ausgelagert, da wir sie durch verschiedene Properties verändern wollen, beispielsweise wieder durch den Raumnamen oder auch den particle count. In der Kachel an sich visualisieren wir den Status der Luftqualität durch die Anzahl der Bubbles, die sich in der Kachel bewegen.  Zusätzlich dazu hat die Kachel eine kleine description-Box, in der Name und Bezeichnung platziert sind. Außerdem findet sich dort auch ein Punkt, der sich je nach Status grün, gelb oder magenta einfärbt und somit eine Art Ampel abbildet.


#### Animated Background

Um mehr Dramaturgie zu erzeugen und einen Wow-Effekt in der App zu bieten, entschieden wir uns für eine dynamische Darstellung der Bubbles. Dies setzten wir im Code mithilfe der Bibliothek Animated Background um, in der wir dann verschiedene Properties festlegen konnten wie beispielsweise wie viele Bubbles in der Kachel schwimmen sollen, wie schnell und mit welcher Transparenz.




## Scanpage

Für die Scanpage nutzen wir eine Bibliothek mit einem QR-Code-Scanner, den wir im Code dann noch einbinden mussten.

```
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: _scanned.isEmpty
                                  ? QrCamera(
                                      fit: BoxFit.cover,
                                      onError: (context, error) =>
                                          Text("Error"),
                                      qrCodeCallback: (code) async {
                                        setState(() {
                                          _scanned = code;
                                        });
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
                                    
                              : RaisedButton(
                                  onPressed: () async {
                                    print(_scanned);
                                  },
                                  child: Text(
                                      "Get data from $_scanned and scan again..."),
                                ),
                              )
```
Das QR-Code Widget mussten wir dann noch mit dem ClipRRect Widget wrapen, um die Ecken des Scanners abrunden zu können, da dies durch keine Property des Scanners editierbar ist. Die Logik dahinter ist relativ simpel, da sich die Kamera nur öffnen soll, wenn der Array mit den zuletzt gescannten Räumen (also nicht mit den Räumen generell, sondern nur der Array der aktuell gescannten Räume!) leer ist. So vermeiden wir einen Fehler, der die Bibliothek nicht wirklich auffangen kann und somit einen Fehler werfen würde. Im nächsten Schritt wird die Kamera geöffnet (bzw. diese ist bereits beim Aufrufen der Seite geöffnet). Wenn man jetzt einen QR-Code scannt, werden die Daten in einen Array gespeichert und von dort dem neuen Array zugewiesen. 

```           qrCodeCallback: (code) async {
                                setState(() {
                                    _scanned = code;
                                });
```
Diese Funktion setzt einen State, indem der ```_scanned```-Array befüllt wird. 

```
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
```
Der zweite Teil der Funktion kümmert sich darum, eine neue Sensor ID zu erstellen, was letztlich zum Anlegen eines neuen Raums führt. Wenn dieser neu angelegt wurde, soll zurück zum Home-Screen navigiert werden, um einen überblick über die gescannten Räume zu erhalten.
Der RaisedButton aus dem Code-Ausschnitt oben wurde hauptsächlich zum Debuggen genutzt. Dadurch war es zu Beginn einfacher, einem Abstürzen des QR-Code-Scanners entgegenzuwirken, da dieser teilweise Fehler wirft, weil die Kamera im Hintergrund immernoch geöffnet war. Durch das Umwandeln der Kamera in den Button wird dies verhindert.



## Statemanagement und Mockdaten

Zu Beginn haben wir zunächst nur mit Mockdaten gearbeitet, um uns in Ruhe auf Layout und die tatsächlichen Funktionen konzentrieren zu können.
Hierfür nutzten wir einen seperaten Ordner im Projekt, in dem wir verschiedene Räume als Dateien anlegten. Diese hatten die Form eines JSON-Objekts, mit den einzelnen Messungen und Timestamps als einzelnen Objekten, wie hier zu sehen.

```
{
    "title": "H 2.17",
    "subtitle": "Klasse 3b",

    "day": [
        {
            "timestamp": 1610565917,
            "ppm": 917
        },
        {
            "timestamp": 1610565317,
            "ppm": 632
        },
        {
            "timestamp": 1610564717,
            "ppm": 957
        },
        {
            "timestamp": 1610564117,
            "ppm": 391
        },
        {
            "timestamp": 1610563517,
            "ppm": 462
        },
        {
            "timestamp": 1610562917,
            "ppm": 923
        },
        {
            "timestamp": 1610562317,
            "ppm": 789
        },
        {
            "timestamp": 1610561717,
            "ppm": 1238
        },
        {
            "timestamp": 1610561117,
            "ppm": 1270
        },
        {
            "timestamp": 1610560517,
            "ppm": 430
        }
    ]
}
```
Wie zu sehen, war in dem Objekt zunächst title und subtitle sowie ein Array day, der die einzelnen Messungen als Objekte beinhaltete.
Um nun trotzdem die Funktion mit dem scannen zu testen, googelten wir eine einfache Methode, einen Server local laufen zu lassen mit unseren Mockdaten. Dabei sind wir auf die Möglichkeit gestoßen, den Python-Befehl ```python -m SimpleHTTPServer``` in der Konsole einzugeben, der einen Server auf dem eigenen Rechner aufsetzt. Nun bekamen wir über die Konsole die Information, auf welchem Port die Daten erreichbar sind und steckten diese URL dann in einen QR-Code-Generator im Internet. Der erzeugte dann den passenden QR-Code zur URL und wir konnten den Scanner testen.

Später, als wir unser Frontend auf die Datenabfrage aus Firebase umstellten, ist der Inhalt des QR-Codes die ID (Sensor ID) geworden, die erzeugt wird, wenn ein Nutzer einen Raum scannt, also wenn dieser sich quasi subscribed. Der Einfachheit halber (Nutzerverwaltung wäre in dieser kurzen Zeit bisschen komplex) haben wir also nur einen Nutzer erstellt, mit dem durch die ID unserer Messstation ein Match entstand und dies in Firebase unter der Collection sensors_users angelegt wurde.

![Alt-Text](/Datenbankstruktur_sensors_users.png)



## Detailscreen - Darstellen der Sensordaten in einem Graph


