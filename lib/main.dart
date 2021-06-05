import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veggy/routes/routes.dart';
import 'package:veggy/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Veggy',
      theme: theme(),
      routes: getRoutesApp(),
    );
  }
}
