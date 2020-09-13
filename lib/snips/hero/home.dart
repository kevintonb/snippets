import 'package:experiment/snips/hero/secondary.dart';
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
          home: HeroHome(),
        );
      });
    });
  }
}

class HeroHome extends StatefulWidget {
  @override
  _HeroHomeState createState() => _HeroHomeState();
}

class _HeroHomeState extends State<HeroHome> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEED598),
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: GestureDetector(
          onDoubleTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HeroSecond()),
             );
          },
          child: Hero(
            tag: "HeroTag",
            child: Icon(Icons.directions_run, size: 40,),
          ),
        ),
      ),
    );
  }
}