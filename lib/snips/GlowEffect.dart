import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:experiment/sizeconfig.dart';
import 'package:avatar_glow/avatar_glow.dart';


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
          home: GlowEffect(),
        );
      });
    });
  }
}

class GlowEffect extends StatefulWidget {
  @override
  _GlowEffectState createState() => _GlowEffectState();
}

class _GlowEffectState extends State<GlowEffect> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: AvatarGlow(
            glowColor: Colors.amber,
            endRadius: 120.0,
            duration: Duration(milliseconds: 2000),
            repeat: true,
            showTwoGlows: true,
            repeatPauseDuration: Duration(milliseconds: 100),
            child: Material(
              elevation: 8.0,
              shape: CircleBorder(),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.network(
                  'https://scontent-maa2-2.cdninstagram.com/v/t51.2885-19/s150x150/110319604_334318084242793_8669473012248682551_n.jpg?_nc_ht=scontent-maa2-2.cdninstagram.com&_nc_ohc=-e0pdmQEOKUAX9dTrjZ&oh=33dcbce057f74058cf6af668bd58ce89&oe=5F78C3C2',
                  height: 60,
                ),
                radius: 50.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}