import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:experiment/sizeconfig.dart';
import 'package:confetti/confetti.dart';

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
          home: Confetti(),
        );
      });
    });
  }
}

class Confetti extends StatefulWidget {
  @override
  _ConfettiState createState() => _ConfettiState();
}

class _ConfettiState extends State<Confetti> {

  ConfettiController _controllerConfetti;

  @override
  void initState() {
    _controllerConfetti = ConfettiController(
        duration: const Duration(
            seconds: 10
        ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controllerConfetti.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: ConfettiWidget(
                confettiController: _controllerConfetti,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: false,
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple
                ], // manually specify the colors to be used
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: FlatButton(
                  onPressed: () {
                    _controllerConfetti.play();
                  },
                  child: _display('Blast'),
              ),
            ),
          ],
        ),
      ),

    );
  }

  Text _display(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.black, fontSize: 20),
    );
  }

}