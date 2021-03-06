import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../general/billetes.dart';
import 'InfoCamaraBillete.dart';
import '../../../main.dart';

class InfoBillete extends StatelessWidget {
  final tipo;

  InfoBillete(this.tipo, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new InfoBilleteStates(tipo);
  }
}

class InfoBilleteStates extends StatefulWidget {
  final tipo;

  InfoBilleteStates(this.tipo, {Key key}) : super(key: key);

  @override
  _InfoBilleteStates createState() => _InfoBilleteStates(this.tipo);
}

class _InfoBilleteStates extends State<InfoBilleteStates> {
  final tipo;

  _InfoBilleteStates(this.tipo);

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
            //height: MediaQuery.of(context).size.width * 0.4,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/image/fondo3.jpg"),
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
            child: DefaultTabController(
              length: tipo.tipoVerificaciones.length,
              child: Scaffold(
                body: TabBarView(
                  children: getTabsWidgets(tipo),
                ),
                bottomNavigationBar: TabBar(
                  tabs: getTabsOptions(tipo),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white54,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.all(2.0),
                  indicatorColor: Colors.blue,
                ),
                backgroundColor: Colors.black,
              ),
            )));
  }

  List<Tab> getTabsOptions(tipo) {
    List<Tab> growableList = [];

    for (TipoVerificacion tipoVerificacion in tipo.tipoVerificaciones) {
      growableList.add(Tab(
        icon: Icon(Icons.insert_chart),
        text: tipoVerificacion.name,
      ));
    }
    return growableList;
  }

  List<StatelessWidget> getTabsWidgets(tipo) {
    List<StatelessWidget> growableList = [];

    for (TipoVerificacion tipoVerificacion in tipo.tipoVerificaciones) {
      growableList.add(TabTipoVerificacion(tipoVerificacion));
    }
    return growableList;
  }
}

class TabTipoVerificacion extends StatelessWidget {
  final tipo;

  TabTipoVerificacion(this.tipo, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tipo.verificaciones.length,
      child: Scaffold(
          body: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/image/fondo3.jpg"),
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
            child: TabBarView(
              children: getTabsWidgets(tipo),
            ),
          ),
          bottomNavigationBar: TabBar(
            tabs: getTabsOptions(tipo),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(2.0),
            indicatorColor: Colors.blue,
          ),
          backgroundColor: Colors.white12),
    );
  }

  List<Tab> getTabsOptions(tipo) {
    List<Tab> growableList = [];

    for (Verificacion tipoVerificacion in tipo.verificaciones) {
      growableList.add(Tab(
        icon: Icon(Icons.remove_red_eye),
        text: tipoVerificacion.name,
      ));
    }
    return growableList;
  }

  List<StatelessWidget> getTabsWidgets(tipo) {
    List<StatelessWidget> growableList = [];

    for (Verificacion verificacion in tipo.verificaciones) {
      growableList.add(TabVerificacion(verificacion));
    }
    return growableList;
  }
}

class TabVerificacion extends StatelessWidget {
  final tipo;

  TabVerificacion(this.tipo, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Builder(
      builder: (BuildContext context) {
        return new Container(
            width: double.infinity,
            height: double.infinity,
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
                child: // Text(tipo.description)
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      Container(
                        //width: MediaQuery.of(context).size.width * 0.5,
                        //height: double.infinity,
                        child: Center(
                            child: Text(
                          tipo.description,
                          style: TextStyle(
                              fontFamily: 'Satisfy',
                              fontSize: 30,
                              color: Colors.white),
                        )),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          //height: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: getTabsWidgets(context),
                          )),
                      Container(child: new CarouselSlider(items: getItemsDetalles(), autoPlay: true,viewportFraction: 0.9,aspectRatio: 2.0,),),
                    ])));
      },

    );
  }

  getItemsDetalles() {
    var listTipo = tipo == 1 ? monedas : billetes;
    return listTipo.map((i) {
      return new Builder(builder: (BuildContext context) {
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
                    MaterialPageRoute(
                        builder: (context) => InfoCamaraBillete(i)),
                  );
                },
                child: null));
      });
    }).toList();
  }

  List<StatelessWidget> getTabsWidgets(BuildContext context) {
    List<StatelessWidget> growableList = [];
    int count = tipo.imagesPath.length;
    for (String verificacionImage in tipo.imagesPath) {
      growableList.add(Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.2 / count,
          decoration: new BoxDecoration(
              image: new DecorationImage(
            image: new AssetImage(verificacionImage),
            fit: BoxFit.fill,
            alignment: Alignment.center,
          ))));
    }
    return growableList;
  }
}
