import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:conectionfirebase/truemoney/general/noticias.dart';

import 'billetes/EligeBillete.dart';

class MostrarHistoria extends StatelessWidget {
  MostrarHistoria({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MostrarHistoriaStates();
  }
}

class MostrarHistoriaStates extends StatefulWidget {
  MostrarHistoriaStates({Key key}) : super(key: key);

  @override
  _MostrarHistoriaStates createState() => _MostrarHistoriaStates();
}

class _MostrarHistoriaStates extends State<MostrarHistoriaStates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'Noticias',
            style: TextStyle(fontFamily: 'Satisfy', fontSize: 30),
          )),
          backgroundColor: Colors.lightBlue[900],
        ),
        body: getSwipper());
  }

  getSwipper() {
    return new Swiper(
      itemBuilder: (BuildContext context, int index) {
        return getPage(index);
      },
      scrollDirection: Axis.vertical,
      itemCount: 2,
      pagination: new SwiperPagination(),
      control: new SwiperControl(),
    );
  }

  getPage(int index) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: new BoxDecoration(
            image: new DecorationImage(
          image: new AssetImage(index == 1
              ? "assets/image/Noticias/Noticia01.jpg"
              : 'assets/image/IMG_quinones.jpg'),
          fit: BoxFit.fill,
          alignment: Alignment.center,
        )),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EligeBillete(index)),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 300.0,),
              child: Container(

                color: Color.fromRGBO(0, 0, 0, 0.5),
                  child: Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20),
                child: Text(
                  index == 1 ? 'Monedas' : 'Quiñones',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontFamily: 'Satisfy',// insert your font size here
                  ),
                ),
              )),
            )));
  }
}
