import 'package:flutter/material.dart';
import 'package:veggy/theme/theme.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme().backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.arrow_upward),
      ),
      /*drawer: ,
      body: ,*/
    );
  }
}