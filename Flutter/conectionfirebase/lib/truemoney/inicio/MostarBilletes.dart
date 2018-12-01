import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MostarBilletes extends StatelessWidget {
  const MostarBilletes({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MyMostrarBilletes();
}

class MyMostrarBilletes extends StatefulWidget {
  MyMostrarBilletes({Key key}) : super(key: key);

  @override
  _MyMostrarBilletes createState() => _MyMostrarBilletes();
}

class _MyMostrarBilletes extends State<MyMostrarBilletes> {
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.lightGreen,
      child: Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
              'Billetes',
              style: TextStyle(fontFamily: 'Satisfy', fontSize: 30),
            )),
            backgroundColor: Colors.lightBlue[900],
          ),
          body: new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/images/images.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text('mi mamadre me mima'))),
    );
  }
}
