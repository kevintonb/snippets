import 'package:experiment/sizeconfig.dart';
import 'package:experiment/snips/ConvexBottom.dart';
import 'package:experiment/snips/GlowEffect.dart';
import 'package:flutter/material.dart';
import 'package:experiment/snips/CircularReveal.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

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
          home: MyHomePage(),
        );
      });
    });
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _buttonPadding = EdgeInsets.only(top: 2 * Responsive.heightMultiplier, right: 10 * Responsive.widthMultiplier, left: 10 * Responsive.widthMultiplier,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("All Snippets"),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: _buttonPadding,
            child: MaterialButton(
              child: Text("#27 Circular Reveal"),
              color: Colors.amber,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CircularReveal()),
              ),
            ),
          ),
          Padding(
            padding: _buttonPadding,
            child: MaterialButton(
              child: Text("#28 Glow Effect"),
              color: Colors.amber,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GlowEffect()),
              ),
            ),
          ),
          Padding(
            padding: _buttonPadding,
            child: MaterialButton(
              child: Text("#29 Convex BottomBar"),
              color: Colors.amber,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConvexBottom()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
