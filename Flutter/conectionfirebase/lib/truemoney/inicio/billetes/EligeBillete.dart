import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'InfoCamaraBillete.dart';

class EligeBillete extends StatelessWidget {
  static const TIPO_BILLETE = 0;
  static const TIPO_MONEDA = 1;
  final tipo;

  EligeBillete(this.tipo, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new EligeBilleteStates(this.tipo);
  }
}

class EligeBilleteStates extends StatefulWidget {
  final tipo;

  EligeBilleteStates(this.tipo, {Key key}) : super(key: key);

  @override
  _EligeBilleteStates createState() => _EligeBilleteStates(this.tipo);
}

class _EligeBilleteStates extends State<EligeBilleteStates> {
  final tipo;

  _EligeBilleteStates(this.tipo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: null,
          backgroundColor: Colors.lightBlue[900],
        ),
        body: getWidgetType());

    //return InfoCamaraBillete();
  }

  getWidgetType() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/images/images.png"),
            fit: BoxFit.fill,
            alignment: Alignment.center,
          ),
        ),
        child: null);

    GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InfoCamaraBillete()),
          );
        },
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/images/images.png"),
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
            child: null));
  }
}
