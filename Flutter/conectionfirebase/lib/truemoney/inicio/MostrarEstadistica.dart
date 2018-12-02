import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';

class MostrarEstadistica extends StatefulWidget{
  @override
  _State createState() => new _State();
}

class Sales {
  String year;
  int sales;
  Sales(this.year, this.sales);
}

class _State extends State<MostrarEstadistica>{

  List<Sales> _data;
  List<charts.Series<Sales, String>> _charData;

  void _makeData(){
    _data = new List<Sales>();
    _charData = new List<charts.Series<Sales, String>>();

    final rnd = new Random();

    _data.add(new Sales("Lu", rnd.nextInt(1000)));

    _data.add(new Sales("Ma", rnd.nextInt(1000)));

    _data.add(new Sales("Mi", rnd.nextInt(1000)));

    _data.add(new Sales("Ju", rnd.nextInt(1000)));
    _data.add(new Sales("Vi", rnd.nextInt(1000)));
    _data.add(new Sales("Sa", rnd.nextInt(1000)));
    _data.add(new Sales("Do", rnd.nextInt(1000)));

    _charData.add(new charts.Series(
        id: 'Sales',
        colorFn: (_,__) => charts.MaterialPalette.yellow.shadeDefault,
        data: _data,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        displayName: 'Sales'
    )
    );
  }

  @override
  void initState() {
    _makeData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Estadisticas"),
        backgroundColor: Colors.blue[900],
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              new Text("Estafas por día de semana"),
              new Expanded(child: new charts.BarChart(_charData),)
            ],
          ),
        ),
      ),
    );
  }
}