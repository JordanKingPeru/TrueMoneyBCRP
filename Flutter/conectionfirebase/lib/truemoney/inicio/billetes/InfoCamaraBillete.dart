import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'InfoBillete.dart';

class InfoCamaraBillete extends StatelessWidget {
  final tipo;

  InfoCamaraBillete(this.tipo, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new InfoCamaraBilleteStates(tipo);
  }
}

class InfoCamaraBilleteStates extends StatefulWidget {
  final tipo;

  InfoCamaraBilleteStates(this.tipo, {Key key}) : super(key: key);

  @override
  _InfoCamaraBilleteStates createState() => _InfoCamaraBilleteStates(this.tipo);
}

class _InfoCamaraBilleteStates extends State<InfoCamaraBilleteStates> {
  final tipo;

  _InfoCamaraBilleteStates(this.tipo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: null,
          backgroundColor: Colors.lightBlue[900],
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/image/fondo3.jpg"),
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
            child: getSelectorWidget()));
  }

  getSelectorWidget() {
    return Container(
        //width: double.infinity,
        //height: MediaQuery.of(context).size.height * 0.4,
        child: new CarouselSlider(items: getItems(), autoPlay: true));
  }

  getItems() {
    return tipo.denominaciones.map<Widget>((i) {
      return new Builder(
        builder: (BuildContext context) {
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
                      MaterialPageRoute(builder: (context) => InfoBillete(i)),
                    );
                  },
                  child: null));
        },
      );
    }).toList();
  }
}
