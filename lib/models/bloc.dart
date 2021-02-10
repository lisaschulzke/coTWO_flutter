import 'package:co_two/models/chart_configuration.dart';
import 'package:co_two/models/sensor.dart';
import 'package:jo_tb_fl_chart/chart_controller_rx.dart';
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
    final opts = DiagramOptions(
      sensorId: id,
      activeToggle: 0,
      diagrams: [
        DiagramControl(
          type: 'CO2',
          unit: 'ppm',
          isExpanded: true,
        ),
        DiagramControl(
          type: 'Temperatur',
          unit: '°C',
          isExpanded: false,
        ),
        DiagramControl(
          type: 'Feuchtigkeit',
          unit: '%',
          isExpanded: false,
        ),
      ],
    );

 // hier werden daten hinzugefügt, datapoints werden hier gefüllt
    if (sensor != null)
      opts.diagrams.forEach((d) {
        List<JODataPoint> datapoints = sensor.measurements
            .map((m) => JODataPoint(
                m.time,
                d.type == 'CO2'
                    ? m.co2.toDouble()
                    : d.type == 'Temperatur'
                        ? m.temperature.toDouble()
                        : m.humidity.toDouble()))
            .toList();
        double upperBound =
            d.type == 'CO2' ? 3500.0 : d.type == 'Temperatur' ? 35.0 : 100.0;
        JOChartControllerRx controller =
            JOChartControllerRx(datapoints: datapoints, upperBound: upperBound);
        d.controller = controller;
      });
    return opts;
  }

  void dispose() {
    _newSensor.close();
    _options.close();
  }
}

final bloc = Bloc();
