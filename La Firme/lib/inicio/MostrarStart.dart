import 'package:flutter/material.dart';
import 'dart:async';
import 'package:la_firme/main.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: new DecorationImage(
              image: new AssetImage("assets/image/bg_splash.jpg"),
              fit: BoxFit.fill,
              alignment: Alignment.center,
            )),
            child: FlareActor(
              "assets/flr/La_Firme_Intro.flr",
              animation: "La Firme Intro",
              //
              // color: Colors.white,
              isPaused: false,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "Bienvenidos",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      "Billetes y\nMonedas",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
