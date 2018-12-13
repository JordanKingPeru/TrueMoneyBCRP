import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'package:la_firme/inicio/complemento/ocr_text_detail.dart';


class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  int _cameraOcr = FlutterMobileVision.CAMERA_BACK;
  bool _autoFocusOcr = true;
  bool _torchOcr = false;
  bool _multipleOcr = true;
  bool _showTextOcr = true;
  List<OcrText> _textsOcr = [];
  List<Widget> items = [];

 ///
 /// OCR Screen
 ///

  
  ///
  /// OCR Method
  ///
  Future<Null> _read() async {
    List<OcrText> texts = [];

   try {
      texts = await FlutterMobileVision.read(
        flash: _torchOcr,
        autoFocus: _autoFocusOcr,
        multiple: _multipleOcr,
        showText: _showTextOcr,
        camera: _cameraOcr,
        fps: 2.0,
      );
    } on Exception {
      texts.add(new OcrText('Failed to recognize text.'));
    }

    if (!mounted) return;

   setState(() => _textsOcr = texts);

  }


  //Captura de fotos
  File image;
  picker() async {
    print('Picker is called');
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    if (img != null) {
      image = img;
      print(img.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getOcrScreen(context), 
      /*Container(
        child: Center(
          child: image == null ? Text("No Image to show") : Image.file(image),
         ),
      ),*/
      floatingActionButton: FloatingActionButton(
        //onPressed: picker,
        onPressed: _read,
        child: Icon(Icons.camera_alt),
      ),
      
    );
  }

  
  Widget _getOcrScreen(BuildContext context) {
    List<Widget> items = [];
    items.addAll(
      ListTile.divideTiles(
        context: context,
        tiles: _textsOcr
            .map(
              (ocrText) => new OcrTextWidget(ocrText),
            )
            .toList(),
      ),
    );

    return new ListView(
      padding: const EdgeInsets.only(
        top: 12.0,
      ),
      children: items,
    );
    }
}

class OcrTextWidget extends StatelessWidget {
  final OcrText ocrText;

  OcrTextWidget(this.ocrText);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: const Icon(Icons.title),
      title: new Text(ocrText.value),
      subtitle: new Text(ocrText.language),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () => Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (context) => new OcrTextDetail(ocrText),
            ),
          ),
    );
  }
}
