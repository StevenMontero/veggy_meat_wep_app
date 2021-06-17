import 'package:flutter/material.dart';
import 'package:veggy/ui/widgets/carousel.dart';
import 'package:veggy/values/responsiveApp.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ResponsiveApp? responsiveApp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.arrow_upward),
        ),
        /*drawer: ,*/
        body: ListView(
          children: [
            Carousel(),
            //Body(responsiveApp!),
            //carousel(),
            //GridProductWidget(),
          ],
        ),
      );
    
  }
}
