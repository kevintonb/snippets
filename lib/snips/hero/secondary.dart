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
          home: HeroSecond(),
        );
      });
    });
  }
}

class HeroSecond extends StatefulWidget {
  @override
  _HeroSecondState createState() => _HeroSecondState();
}

class _HeroSecondState extends State<HeroSecond> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEED598),
      resizeToAvoidBottomPadding: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onDoubleTap: () {
              Navigator.pop(context);
            },
            child: Hero(
              tag: "HeroTag",
              child: Icon(Icons.directions_run, size: 120,),
            ),
          ),
        ],
      ),
    );
  }
}