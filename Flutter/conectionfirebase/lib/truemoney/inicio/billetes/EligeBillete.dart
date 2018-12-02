import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
        child: getSelectorWidget());
/*
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
            child: null));*/
  }

  getSelectorWidget() {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width * 0.4,
        child: new CarouselSlider(
            items: [1,2,3,4,5].map((i) {
              return new Builder(
                builder: (BuildContext context) {
                  return new Container(
                      width: MediaQuery.of(context).size.width,
                      margin: new EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: new BoxDecoration(
                          color: Colors.amber
                      ),
                      child: new Text('text $i', style: new TextStyle(fontSize: 16.0),)
                  );
                },
              );
            }).toList(),
            autoPlay: true
        ));
  }
}
