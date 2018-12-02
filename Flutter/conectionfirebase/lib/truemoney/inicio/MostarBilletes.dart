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
            'Comprobar',
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

  getPage(int index){
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/images/images.png"),
              fit: BoxFit.fill,
              alignment: Alignment.center,
            )),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EligeBillete()),
              );
            },
            child: null));
  }
}
