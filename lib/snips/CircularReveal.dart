import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRA Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CircularReveal(),
    );
  }
}

class CircularReveal extends StatefulWidget {
  @override
  _CircularRevealState createState() => _CircularRevealState();
}

class _CircularRevealState extends State<CircularReveal>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Circular Reveal")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    child: Text("chadwick boseman"),
                    onPressed: () => showRevealDialog(context),
                    color: Colors.amber,
                  ),
                  MaterialButton(
                    child: Text('black panther'),
                    onPressed: () {
                      if (animationController.status ==
                              AnimationStatus.forward ||
                          animationController.status ==
                              AnimationStatus.completed) {
                        animationController.reverse();
                      } else {
                        animationController.forward();
                      }
                    },
                    color: Colors.amber,
                  ),
                ],
              ),
              SizedBox(height: 16),
              CircularRevealAnimation(
                child: Image.network(
                  'https://i.pinimg.com/originals/fe/0e/1e/fe0e1ed35521c80c649e150c5c5e94b0.jpg',
                  height: 0.7 * MediaQuery.of(context).size.height,
                ),
                animation: animation,
                centerOffset: Offset(130, 100),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showRevealDialog(BuildContext context) async {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.network(
                  'https://i.pinimg.com/originals/87/78/99/8778996ef9c3616f16413ac0e84a8aa0.png'),
            ),
            margin: EdgeInsets.only(top: 50, left: 12, right: 12, bottom: 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return CircularRevealAnimation(
          child: child,
          animation: anim1,
          centerAlignment: Alignment.bottomCenter,
        );
      },
    );
  }
}

