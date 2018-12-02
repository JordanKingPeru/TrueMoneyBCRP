import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'InfoCamaraBillete.dart';

class EligeBillete extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new EligeBilleteStates();
  }
}

class EligeBilleteStates extends StatefulWidget {
  EligeBilleteStates({Key key}) : super(key: key);

  @override
  _EligeBilleteStates createState() => _EligeBilleteStates();
}

class _EligeBilleteStates extends State<EligeBilleteStates> {

  var indexState = 0;

  handleTap() {
    setState(() {
      indexState = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (indexState == 0) {
      return Scaffold(
          appBar: AppBar(
            title: null,
            backgroundColor: Colors.lightBlue[900],
          ),
          body: GestureDetector(
              onTap: () {
                handleTap();
              },
              child: Container(
                  width : double.infinity,
                  height : double.infinity,
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/images.png"),
                        fit: BoxFit.fill,
                        alignment: Alignment.center,
                      ),

                  ),
                  child: null)));
    }
    return InfoCamaraBillete();
  }

}