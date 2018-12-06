import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../general/billetes.dart';
import 'InfoCamaraBillete.dart';

class EligeBillete extends StatelessWidget {
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
            image: new AssetImage("assets/image/fondo3.jpg"),
            fit: BoxFit.fill,
            alignment: Alignment.center,
          ),
        ),
        child: getSelectorWidget());
  }

  getSelectorWidget() {
    return Column(
      children: [
        Padding(
            padding: EdgeInsetsDirectional.only(
          top: MediaQuery.of(context).size.height * 0.25,
        )),
        Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            child: new CarouselSlider(
              items: getItems(),
              autoPlay: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
            )),
        new Container(
            child: Text(
          'Elige una denominación',
          style: TextStyle(
              fontFamily: 'Roboto', fontSize: 30, color: Colors.white),
        )),
      ],
    );
  }

  getItems() {
    var listTipo = tipo == 1 ? monedas : billetes;
    return listTipo.map((i) {
      return new Builder(builder: (BuildContext context) {
        return new Container(
            width: double.infinity,
            height: double.infinity,
            decoration: new BoxDecoration(
                image: new DecorationImage(
              image: new AssetImage(i.imagePath),
              fit: BoxFit.fill,
              alignment: Alignment.center,
            )),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InfoCamaraBillete(i)),
                );
              },
            ));
      });
    }).toList();
  }
}
