import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 // This widget is the root of your application.
 @override
 Widget build(BuildContext context) {
  return MaterialApp(
   title: 'Flutter Demo',
   theme: ThemeData(
    // This is the theme of your application.
    //
    // Try running your application with "flutter run". You'll see the
    // application has a blue toolbar. Then, without quitting the app, try
    // changing the primarySwatch below to Colors.green and then invoke
    // "hot reload" (press "r" in the console where you ran "flutter run",
    // or simply save your changes to "hot reload" in a Flutter IDE).
    // Notice that the counter didn't reset back to zero; the application
    // is not restarted.
    primarySwatch: Colors.blue,
   ),
   home: ScreenshotWidget(title: 'Screenshot Demo Home Page'),
  );
 }
}

class ScreenshotWidget extends StatefulWidget {
 ScreenshotWidget({Key key, this.title}) : super(key: key);

 // This widget is the home page of your application. It is stateful, meaning
 // that it has a State object (defined below) that contains fields that affect
 // how it looks.

 // This class is the configuration for the state. It holds the values (in this
 // case the title) provided by the parent (in this case the App widget) and
 // used by the build method of the State. Fields in a Widget subclass are
 // always marked "final".

 final String title;

 @override
 _ScreenshotWidgetState createState() => _ScreenshotWidgetState();
}

class _ScreenshotWidgetState extends State<ScreenshotWidget> {
 int _counter = 0;
 File _imageFile;

 ScreenshotController screenshotController = ScreenshotController();

 @override
 void initState() {
  // TODO: implement initState
  super.initState();
 }

 void _incrementCounter() {
  setState(() {
   _counter++;
  });
 }

 @override
 Widget build(BuildContext context) {
  return Scaffold(
   appBar: AppBar(
    title: Text("Title"),
   ),
   body: Container(
    child: new Center(
     child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
       Screenshot(
        controller: screenshotController,
        child: Column(
         children: <Widget>[
          Text(
           'You have pushed the button this many times:' +
               _counter.toString(),
          ),
          FlutterLogo(),
         ],
        ),
       ),
       _imageFile != null ? Image.file(_imageFile) : Container(),
      ],
     ),
    ),
   ),
   floatingActionButton: FloatingActionButton(
    onPressed: () {
     _incrementCounter();
     _imageFile = null;
     screenshotController
         .capture(delay: Duration(milliseconds: 10))
         .then((File image) async {
      setState(() {
       _imageFile = image;
      });
//      final result = await ImageGallerySaver.save(image.readAsBytesSync());
      print("File Saved to Gallery");
     }).catchError((onError) {
      print(onError);
     });
    },
    tooltip: 'Increment',
    child: Icon(Icons.add),
   ), // This trailing comma makes auto-formatting nicer for build methods.
  );
 }

 _saved(File image) async {
//  final result = await ImageGallerySaver.save(image.readAsBytesSync());
  print("File Saved to Gallery");
 }
}