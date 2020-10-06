import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: DataTableExample(),
    );
  }
}

class DataTableExample extends StatefulWidget {
  DataTableExample({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DataTableExampleState createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Name',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Age',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Role',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Married',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: const <DataRow>[
              DataRow(

                cells: <DataCell>[
                  DataCell(Text('Antony')),
                  DataCell(Text('23')),
                  DataCell(Text('Developer')),
                  DataCell(Text('No')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Neil')),
                  DataCell(Text('22')),
                  DataCell(Text('Analyst')),
                  DataCell(Text('No')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Jonas')),
                  DataCell(Text('41')),
                  DataCell(Text('Designer')),
                  DataCell(Text('Yes')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
