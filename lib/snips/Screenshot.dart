import 'dart:io';
import 'package:flutter/material.dart';


// void main() => runApp(MyApp());

class BottomSheetRound extends StatefulWidget {
  @override
  _BottomSheetRoundState createState() => _BottomSheetRoundState();
}

class _BottomSheetRoundState extends State<BottomSheetRound> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.black,
                child: Text("Normal Sheet", style: TextStyle(color: Colors.white),),
                onPressed: (){
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 250,
                        color: Colors.black,
                      );
                    },
                  );
            }),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
                color: Colors.black,
                child: Text("Rounded Sheet", style: TextStyle(color: Colors.white),),
                onPressed: (){
                  showModalBottomSheet<void>(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 250,
                        color: Colors.black,
                      );
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}