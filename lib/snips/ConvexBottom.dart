import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:experiment/sizeconfig.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        Responsive().init(constraints, orientation);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: ConvexBottom(),
        );
      });
    });
  }
}

class ConvexBottom extends StatefulWidget {
  @override
  _ConvexBottomState createState() => _ConvexBottomState();
}

class _ConvexBottomState extends State<ConvexBottom> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
    );
  }
}