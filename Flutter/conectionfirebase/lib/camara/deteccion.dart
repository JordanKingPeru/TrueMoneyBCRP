import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:io';
import 'package:conectionfirebase/main.dart';


class Deteccion extends StatelessWidget {



  File imgFoto;
  static File imgFotoStatic;


  Deteccion({Key key, @required this.imgFoto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    imgFotoStatic = imgFoto;
    return new DeteccionStates();
  }
}

class DeteccionStates extends StatefulWidget {
  DeteccionStates({Key key}) : super(key: key);

  @override
  _DeteccionStates createState() => _DeteccionStates();

}

class _DeteccionStates extends State<DeteccionStates> {


  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('DETECCION BILLETES - IA'),
        ),
        body:
        new Center(
            child: Deteccion.imgFotoStatic == null
                ? new Text('')
                : new Image.file( Deteccion.imgFotoStatic)//new Image.file(new File(Deteccion.rutaFotoStatic))
          //Center(
          //child: RaisedButton(
          //child: Text(Deteccion.rutaFotoStatic),
          //onPressed: () {
          // Navigate to second screen when tapped!
          //},
          //),
        ),
      );
    }
}
