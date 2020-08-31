import 'package:flutter/material.dart';
import 'package:experiment/snips/CircularReveal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          MaterialButton(
            child: Text("#27 Circular Reveal"),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CircularReveal()),
            ),
          ),
        ],
      ),
    );
  }
}
