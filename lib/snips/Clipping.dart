import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
 // This widget is the root of your application.
 @override
 Widget build(BuildContext context) {
  return MaterialApp(
   debugShowCheckedModeBanner: false,
   title: 'Flutter Demo',
   home: ClipPage(),
  );
 }
}
class ClipPage extends StatefulWidget {
 ClipPage({Key key, this.title}) : super(key: key);
 final String title;
 @override
 _ClipPageState createState() => _ClipPageState();
}
class _ClipPageState extends State<ClipPage> {
 @override
 Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      appBar: AppBar(
        title: Text("Clippers"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: PageView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text("ClipRect", style: TextStyle(fontSize: 20),),
                    SizedBox(
                      height: 20,
                    ),
                    ClipRect(
                      child: Container(
                        child: Align(
                          alignment: Alignment.center,
                          widthFactor: 0.4,
                          heightFactor: 1.0,
                          child: Image.network(
                              'https://images.unsplash.com/photo-1602836947245-d5f16ac3984f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text("ClipRRect", style: TextStyle(fontSize: 20),),
                    SizedBox(
                      height: 20,
                    ),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(300.0),
                      child: Image.network(
                          "https://images.unsplash.com/photo-1602836947245-d5f16ac3984f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text("ClipOval", style: TextStyle(fontSize: 20),),
                    SizedBox(
                      height: 20,
                    ),

                    ClipOval(
                      child: Image.network(
                          "https://images.unsplash.com/photo-1602836947245-d5f16ac3984f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
 }
}

//https://images.unsplash.com/photo-1602836947245-d5f16ac3984f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80