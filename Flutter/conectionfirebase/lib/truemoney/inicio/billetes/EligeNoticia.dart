import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../general/noticias.dart';
import 'InfoCamaraBillete.dart';

class EligeNoticia extends StatelessWidget {
  final tipo;

  EligeNoticia(this.tipo, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new EligeNoticiaStates(this.tipo);
  }
}

class EligeNoticiaStates extends StatefulWidget {
  final tipo;

  EligeNoticiaStates(this.tipo, {Key key}) : super(key: key);

  @override
  _EligeNoticiaStates createState() => _EligeNoticiaStates(this.tipo);
}

class _EligeNoticiaStates extends State<EligeNoticiaStates> {
  final tipo;

  _EligeNoticiaStates(this.tipo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: null,
          backgroundColor: Colors.grey[900],
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
            image: new AssetImage(Noticias[tipo].imagePath),
            fit: BoxFit.fill,
            alignment: Alignment.center,
          ),
        ),
        child: getSelectorWidget());
  }

  getSelectorWidget() {
    return Container();

  }



}
