import 'package:co_two/models/chart_configuration.dart';
import 'package:co_two/models/sensor.dart';
import 'package:rxdart/rxdart.dart';

class Bloc {
  static final version = '1.0.0';

  final _newSensor = BehaviorSubject<Sensor>();
  //reaktive Programm. speichert letzten Wert und sendet veränderung an alle abonnenten
  final _options = BehaviorSubject<DiagramOptions>();

  Stream<Sensor> get newSensor => _newSensor.stream;
  Function(Sensor) get addSensor => _newSensor.add;

  Stream<DiagramOptions> get options => _options.stream;
  Function(DiagramOptions) get updateOptions => _options.add;

  Future<void> getInitialOptions(String id, Sensor sensor) async {
    final options = _getInitialOptions(id, sensor);
    _options.add(options);
  }

  DiagramOptions _getInitialOptions(String id, [Sensor sensor]) {
    final _options = DiagramOptions(
      sensorId: id,
      activeToggle: 0,
      diagrams: [
        DiagramControl(
          type: 'CO2',
          unit: 'ppm',
          isExpanded: true,
          interval: DiagramTimeInterval(
            from: DiagramTimeInterval.justifyToMinutes(
                    DateTime.now().millisecondsSinceEpoch, 5) -
                DiagramTimeInterval.hour +
                1,
            to: DiagramTimeInterval.justifyToMinutes(
                DateTime.now().millisecondsSinceEpoch, 5),
            size: DiagramTimeInterval.hour,
          ),
          datapoints: <DataPoint>[],
          lowerBound: 0.0,
          upperBound: 3500.0,
          offset: 0.0,
        ),
        DiagramControl(
          type: 'Temperatur',
          unit: '°C',
          isExpanded: false,
          interval: DiagramTimeInterval(
            from: DiagramTimeInterval.justifyToMinutes(
                    DateTime.now().millisecondsSinceEpoch, 5) -
                DiagramTimeInterval.hour +
                1,
            to: DiagramTimeInterval.justifyToMinutes(
                DateTime.now().millisecondsSinceEpoch, 5),
            size: DiagramTimeInterval.hour,
          ),
          datapoints: <DataPoint>[],
          lowerBound: 0.0,
          upperBound: 35.0,
          offset: 0.0,
        ),
        DiagramControl(
          type: 'Feuchtigkeit',
          unit: '%',
          isExpanded: false,
          interval: DiagramTimeInterval(
            from: DiagramTimeInterval.justifyToMinutes(
                    DateTime.now().millisecondsSinceEpoch, 5) -
                DiagramTimeInterval.hour +
                1,
            to: DiagramTimeInterval.justifyToMinutes(
                DateTime.now().millisecondsSinceEpoch, 5),
            size: DiagramTimeInterval.hour,
          ),
          datapoints: <DataPoint>[],
          lowerBound: 0.0,
          upperBound: 100.0,
          offset: 0.0,
        ),
      ],
    );
    if (sensor != null)
      _options.diagrams.forEach(
          (d) => d.datapoints = sensor.getDataPoints(d.type, d.interval));
    return _options;
  }

  void dispose() {
    _newSensor.close();
    _options.close();
  }
}

final bloc = Bloc();
