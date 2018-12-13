import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MostrarLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Roboto',
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  String nombre = "";
  String foto = "";

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    setState(() {
      nombre = user.displayName;
      foto = user.photoUrl;
    });

    _alertDialog();

    print("nombre usuario : ${user.displayName}");
    return user;
  }

  void _alertDialog() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 200.0,
        child: new Column(
          children: <Widget>[
            new Text(
              "Registro completo",
              style: new TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            new Divider(),
            new ClipOval(child: new Image.network(foto)),
            new Text("Bienvenido $nombre"),
            new RaisedButton(
              child: new Text("OK",style: TextStyle(color: Colors.white),),
              onPressed: () => Navigator.of(context,rootNavigator: true).pop(),
              color: Colors.lightBlue[900],
            )
          ],
        ),
      ),
    );

    // ignore: deprecated_member_use
    showDialog(context: context, child: alertDialog);
  }

  void _signOut() {
    googleSignIn.signOut();
    print("Sesión cerrada");
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/image/logo_splash.png'),
      ),
    );

    final email = Center(
      child: Text('Conéctate y ayúdanos a evitar estafas'),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(50.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: Column(
          children: <Widget>[
            MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: () =>
                  _signIn().then((FirebaseUser user) => print(user)),
              color: Colors.lightBlue[900],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.chrome_reader_mode, color: Colors.white),
                  SizedBox(width: 8.0),
                  Text('Google Login', style: TextStyle(color: Colors.white))
                ],
              ),
            ),
            MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: () => _signOut(),
              color: Colors.lightBlue[900],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.cancel, color: Colors.white),
                  SizedBox(width: 8.0),
                  Text('Sign out', style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
            child: Text(
          'Mi Perfil',
          style: TextStyle(
              fontFamily: 'Satisfy', fontSize: 30, color: Colors.white),
        )),
        backgroundColor: Colors.lightBlue[900],
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            //password,
            SizedBox(height: 24.0),
            loginButton,
          ],
        ),
      ),
    );
  }
}
