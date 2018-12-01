import 'package:flutter/material.dart';
import 'truemoney/HomePage.dart';

void main() => runApp(new HomePage());
/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LaFirme',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: [
            new Container(
              child: Scaffold(
                appBar: AppBar(
                  title: Center(
                      child: Text(
                    'Comprobar',
                    style: TextStyle(fontFamily: 'Satisfy', fontSize: 30),
                  )),
                  backgroundColor: Colors.lightBlue[900],
                ),
                body: new Container(
                  child: Text('mi mamadre me mima'),
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                        // Load image from assets
                          image: new AssetImage('assets/images/images.png'),
                          // Make the image cover the whole area
                          fit: BoxFit.cover)),
                ),
              ),
            ),
            new Container(
              color: Colors.orange,
              child: Scaffold(
                appBar: AppBar(
                  title: Center(
                      child: Text(
                    'Historia',
                    style: TextStyle(fontFamily: 'Satisfy', fontSize: 30),
                  )),
                  backgroundColor: Colors.lightBlue[900],
                ),
                body: ListView(
                  children: [
                    Image.asset(
                      'assets/image/fondo.jpg',
                      width: 600.0,
                      height: 240.0,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            new Container(
              color: Colors.lightGreen,
              child: Scaffold(
                appBar: AppBar(
                  title: Center(
                      child: Text(
                    'Estadísticas',
                    style: TextStyle(fontFamily: 'Satisfy', fontSize: 30),
                  )),
                  backgroundColor: Colors.lightBlue[900],
                ),
              ),
            ),
            new Container(
              color: Colors.red,
              child: Scaffold(
                appBar: AppBar(
                  title: Center(
                      child: Text(
                    'Mi perfil',
                    style: TextStyle(fontFamily: 'Satisfy', fontSize: 30),
                  )),
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
*/