
// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'inicio/MostarBilletes.dart';

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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: [
            new MostarBilletes(),
            new Container(
              color: Colors.orange,
              child: Scaffold(
                appBar: AppBar(
                  title: Center(child: Text('Historia',
                    style: TextStyle(fontFamily: 'Satisfy', fontSize: 30),)),
                  backgroundColor: Colors.lightBlue[900],
                ),
              ),
            ),
            new Container(
              color: Colors.lightGreen,
              child: Scaffold(
                appBar: AppBar(
                  title: Center(child: Text('Estadísticas',
                    style: TextStyle(fontFamily: 'Satisfy', fontSize: 30),)),
                  backgroundColor: Colors.lightBlue[900],
                ),
              ),
            ),
            new Container(
              color: Colors.red,
              child: Scaffold(
                appBar: AppBar(
                  title: Center(child: Text('Mi perfil',
                    style: TextStyle(fontFamily: 'Satisfy', fontSize: 30),)),
                  backgroundColor: Colors.lightBlue[900],
                ),
              ),
            ),
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
              text: 'Historia',
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