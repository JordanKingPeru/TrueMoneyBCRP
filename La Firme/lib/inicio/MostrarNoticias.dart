import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:xml2json/xml2json.dart';

class MostrarNoticia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter news",
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetNocias(title: 'Users'),
    );
  }
}

class GetNocias extends StatefulWidget {
  GetNocias({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GetNociasState createState() => _GetNociasState();
}

class _GetNociasState extends State<GetNocias> {
  final String url =
      'https://news.google.com/_/rss/search?q=moneda+billete%7CPer%C3%BA&hl=es-419&gl=PE&ceid=PE:es-419';
  final Xml2Json xml2json = Xml2Json();

  Future<List<User>> _getNoticias() async {
    http.Response response = await http.get(url);
    xml2json.parse(response.body);
    //print(response.body);
    var jsondata = xml2json.toGData();
    var data = json.decode(jsondata);
    print(data["rss"]["channel"]["item"]);

    List<User> users = [];
    List data_f;
    data_f = data["rss"]["channel"]["item"];

    print(data_f[16]['title']['\$t']);
    print(data_f[16]['link']['\$t']);
    print(data_f[16]['pubDate']['\$t']);
    print(data_f[16]["description"]['\$t']);
    print(data_f[16]["media"]);
    String _parseHtmlString(String htmlString) {
      var document = parse(htmlString);

      String parsedString = parse(document.body.text).documentElement.text;
      return parsedString;
    }

    print(_parseHtmlString(data_f[0]["description"]['\$t']));

    if (data_f.length > 20) {
      print(data_f.length);
    }
    for (var u in data_f) {
      User user = User(u["title"]['\$t'], u["link"]['\$t'], u["pubDate"]['\$t'],
          _parseHtmlString(u["description"]['\$t']));

      //User user = User(u["status"], u["totalResults"]);

      users.add(user);
      //  print(u);
    }

    print(users.length);

    return users;

    /* Proceso inicial Ya comprobado
    var data = await http.get('https://newsapi.org/v2/everything?q=billete&apiKey=4c1b4682544b42359685ec15a7ae7936');
    var jsonData = json.decode(data.body);
    
    List<User> users = [];
    List data_f;
    data_f = jsonData["articles"];

    for (var u in data_f) {
      User user = User(u["author"], u["title"], u["description"], u["url"],
          u["urlToImage"], u["publishedAt"], u["content"]);

      //User user = User(u["status"], u["totalResults"]);

      users.add(user);
      //  print(u);
    }

    print(users.length);

    return users;
*/
  }

  @override
  Widget build(BuildContext context) {
    final String _img = 'assets/image/fondo2.jpg';
    return Scaffold(
      //appBar: AppBar(title: Text(widget.title),      ),
      body: Container(
        margin: const EdgeInsets.only(
            left: 10.0, right: 10.0, bottom: 15.0, top: 15.0),
        child: Material(
          borderRadius: BorderRadius.circular(6.0),
          elevation: 2.0,
          child: FutureBuilder(
              future: _getNoticias(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text("Loading..."),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.all(7.0),
                        child: Material(
                          shadowColor: Colors.black,
                          elevation: 2.0,
                          borderRadius: BorderRadius.circular(10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) =>
                                          DetailPage(snapshot.data[index])));
                            },
                            child: Container(
                              height: 95.0,
                              margin: const EdgeInsets.all(5.0),
                              //decoration: new BoxDecoration(
                              //border: new Border.all(color: Colors.blueAccent),
                              //borderRadius: BorderRadius.circular(10.0),
                              //),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 95.0,
                                    height: 95.0,
                                    //child: Text('data'),
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                        image: AssetImage(_img),
                                        fit: BoxFit.cover
                                      ),
                                    ),
                                  ),
                                  /*FadeInImage.assetNetwork(
                                    placeholder: '',
                                    image:
                                        _img, // _img == null ? 'http://www.esan.edu.pe/sala-de-prensa/2016/06/16/bcrp_principal.jpg':'2',
                                    fit: BoxFit.cover,
                                    width: 95.0,
                                    height: 95.0,
                                  ),*/
                                  Expanded(
                                    child: Container(
                                        margin: EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              snapshot.data[index].title,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              snapshot.data[index].pubDate,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5.0),
                                              child: Text(
                                                snapshot
                                                    .data[index].description,
                                                maxLines: 1,
                                              ),
                                            )
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                      /*
                      return ListTile(
                        leading: CircleAvatar(
                            //backgroundImage:
                            //  NetworkImage(snapshot.data[index].urlToImage),
                            ),
                        title: Text(snapshot.data[index].title),
                        subtitle: Text(snapshot.data[index].pubDate),
                        //trailing: Text(snapshot.data[index].description),
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(snapshot.data[index])));
                        },
                      );
                      */
                    },
                  );
                }
              }),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final User user;
  DetailPage(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.title),
      ),
    );
  }
}

class User {
  final String title;
  final String link;
  final String pubDate;
  final String description;

  User(this.title, this.link, this.pubDate, this.description);
}
/*
class User {
  //final List source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  User(this.author, this.title, this.description, this.url, this.urlToImage,
      this.publishedAt, this.content);
}
*/
