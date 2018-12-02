import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
//camera flutter by ricky
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:conectionfirebase/camara/deteccion.dart';
import 'package:image_cropper/image_cropper.dart';

//void main() => runApp(new MyApp());
import 'truemoney/HomePage.dart';

void main() => runApp(new HomePage());

/* camera  */

List<CameraDescription> cameras;
//ruta de la foto.
String imagePath;

/*
Future<void> main() async {
  cameras = await availableCameras();
  runApp(MyApp());
}
*/
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  /*  camera end*/

  //class MyApp extends StatelessWidget {
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

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }


  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  Future<String> takePicture() async {
    if (!controller.value.isInitialized) {
      //showInSnackBar('Error: select a camera first.');
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.jpg';

    if (controller.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      await controller.takePicture(filePath);
    } on CameraException catch (e) {
      //_showCameraException(e);
      return null;
    }
    return filePath;
  }

  static Future<File> _cropImage() async {
    File imageCrop = await ImageCropper.cropImage(
        sourcePath: imagePath,
        ratioX: 1.0,
        ratioY: 1.0,
        maxWidth: 100,
        maxHeight: 100
    );
    return imageCrop;


  }

  void onTakePictureButtonPressed() {
    debugPrint("LaFirme: TOMANDO FOTO");
    takePicture().then((String filePath)  {
      if (mounted) {
        setState(() {
          imagePath = filePath;
          //videoController?.dispose();
          //videoController = null;
          debugPrint("LaFirme: " + imagePath);
          if (controller != null) {
            try{
              controller.dispose();
            }catch(err){
              print(err);
            }
            debugPrint("LaFirme: Recortando la imagen");
            _cropImage().then((File imageCrop){
              setState(() {
                debugPrint("LaFirme: Cambiando de Ventana");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Deteccion(imgFoto: imageCrop)));
              });
            });


          }


        });

        //if (filePath != null) showInSnackBar('Picture saved to $filePath');
      }
      else{
        debugPrint("LaFirme: NO TOMO FOTO ");
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    return new GestureDetector(
      onTap:(){
        debugPrint("LaFirme: Hizo Clic en la Pantalla");
        onTakePictureButtonPressed();
    } /*: controller != null &&
            controller.value.isInitialized &&
            !controller.value.isRecordingVideo
            ? onTakePictureButtonPressed
            : null*/
      ,
        child : new Stack(  /*Scaffold(*/
      alignment: FractionalOffset.center,
      children: <Widget>[
        new Transform.scale(
          scale: controller.value.aspectRatio / deviceRatio,
          child: new AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: new CameraPreview(controller)),
        ),
        new Positioned.fill(
          child: new Opacity(
            opacity: 0.8,
            child: new Image.network(
              'http://iple.com.pe/wp-content/uploads/2018/12/marco_billete_-1.png',
              fit: BoxFit.cover,//.fill
            ),
          ),
        ),

      ],
      /*
      appBar: new AppBar(
        title: new Text('DETECTANDO BILLETES'),
      ),
      body: new Center(
        child: _image == null
            ? new Text('No image selected.')
            : new Image.file(_image),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: new Icon(Icons.add_a_photo),
      ),
      */
    ));
  }

  /*
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
<<<<<<< HEAD
                body : Center(
                  child :Text('mi mama me mima'),
=======
                body: new Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      // Load image from assets
                      image: new AssetImage('assets/image/fondo1.jpg'),
                      // Make the image cover the whole area
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text('JK'),
>>>>>>> origin/master
                ),
              ),
            ),
            new Container(
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
                      'assets/image/fondo2.jpg',
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
  }*/
}
