// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'inicio/MostarBilletes.dart';
import 'inicio/MostarHistoria.dart';
import 'inicio/MostrarEstadistica.dart';
import 'inicio/MostrarLogin.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'La Firme',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<MyHomePage> {
  var mostrarBilletes;
  var mostrarHistoria;
  var mostrarEstadistica;
  var mostrarLogin;

  getMostrarBilletes() {
    if (mostrarBilletes == null) {
      mostrarBilletes = new MostrarBilletes();
    }
    return mostrarBilletes;
  }

  getMostrarHistorias() {
    if (mostrarHistoria == null) {
      mostrarHistoria = new MostrarHistoria();
    }
    return mostrarHistoria;
  }

  getMostrarEstadistica() {
    if (mostrarEstadistica == null) {
      mostrarEstadistica = new MostrarEstadistica();
    }
    return mostrarEstadistica;
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
            getMostrarBilletes(),
            getMostrarHistorias(),
            getMostrarEstadistica(),
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
