import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'billetes/EligeBillete.dart';

class MostrarBilletes extends StatelessWidget {
  MostrarBilletes({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MostrarBilletesStates();
  }
}

class MostrarBilletesStates extends StatefulWidget {
  MostrarBilletesStates({Key key}) : super(key: key);

  @override
  _MostrarBilletesStates createState() => _MostrarBilletesStates();
}

class _MostrarBilletesStates extends State<MostrarBilletesStates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'Comprueba',
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
      //control: new SwiperControl(), //agregar flechas de guia
    );
  }

  getPage(int index) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: new BoxDecoration(
            image: new DecorationImage(
          image: new AssetImage(index == 1
              ? "assets/image/fondo2.jpg"
              : 'assets/image/fondo1.jpg'),
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
              padding: const EdgeInsets.only(
                top: 0.0,
              ),
              child: Container(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  child: Center(
                    //margin: EdgeInsetsDirectional.only(bottom: 50),
                    child: Text(
                      index == 1 ? 'Monedas' : 'Billetes',
                      style: TextStyle(
                        fontSize: 45.0,
                        color: Colors.white,
                        fontFamily: 'Satisfy', // insert your font size here
                      ),
                    ),
                  )),
            )));
  }
}
