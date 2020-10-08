import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: UuidSnippet(),
    );
  }
}

class UuidSnippet extends StatefulWidget {
  UuidSnippet({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UuidSnippetState createState() => _UuidSnippetState();
}

class _UuidSnippetState extends State<UuidSnippet> {
  var uuid = Uuid();

  String v1 = "null";
  String v4 = "null";
  String v5 = "null";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                color: Colors.orange[300],
                child: Text(
                  "Generate v1()",
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                onPressed: () {
                  setState(() {
                    v1 = uuid.v1();
                  });
                },
              ),
              Text("$v1"),
              RaisedButton(
                color: Colors.orange[600],
                child: Text(
                  "Generate v4()",
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                onPressed: () {
                  setState(() {
                    v4 = uuid.v4();
                  });
                },
              ),
              Text("$v4"),
              RaisedButton(
                color: Colors.orange[800],
                child: Text(
                  "Generate v5()",
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                onPressed: () {
                  setState(() {
                    v5 = uuid.v5(Uuid.NAMESPACE_URL, 'www.kevintonb.com');
                  });
                },
              ),
              Text("$v5"),
            ],
          ),
        ),
      ),
    );
  }
}
