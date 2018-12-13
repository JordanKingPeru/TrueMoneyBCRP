import 'package:flutter/material.dart';
import 'package:la_firme/inicio/MostrarLogin.dart';
import 'package:la_firme/inicio/MostrarStart.dart';
//import 'package:la_firme/inicio/complemento/UsarCamara.dart';
import 'package:la_firme/inicio/MostrarNoticias.dart';


void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'La Firme',
      home: new SplashScreen(),
      //home: new CameraApp(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<MyHomePage> {
/*
  var mostrarBilletes;
  var mostrarEstadistica;
*/
  var mostrarNoticia;
  var mostrarLogin;

/*
  getMostrarBilletes() {
    if (mostrarBilletes == null) {
      mostrarBilletes = new MostrarBilletes();
    }
    return mostrarBilletes;
  }

  

  getMostrarEstadistica() {
    if (mostrarEstadistica == null) {
      mostrarEstadistica = new MostrarEstadistica();
    }
    return mostrarEstadistica;
  }
*/
  getMostrarNoticias() {
    if (mostrarNoticia == null) {
      mostrarNoticia = new MostrarNoticia();
    }
    return mostrarNoticia;
  }
  getMostrarLogin() {
    if (mostrarLogin == null) {
      mostrarLogin = new MostrarLogin();
    }
    return mostrarLogin;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: [
            //getMostrarBilletes(),
            //getMostrarHistorias(),
            //getMostrarEstadistica(),

            Container(
              color: Colors.blue,
            ),
            getMostrarNoticias(),
            Container(
              color: Colors.red,
            ),
            getMostrarLogin(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: 'Home',
            ),
            Tab(
              icon: Icon(Icons.school),
              text: 'Noticias',
            ),
            Tab(
              icon: Icon(Icons.insert_chart),
              text: 'Estadística',
            ),
            Tab(
              icon: Icon(Icons.perm_identity),
              text: 'Perfil',
            )
          ],
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(2.0),
          indicatorColor: Colors.blue,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
