import 'package:flutter/material.dart';
import 'package:veggy/ui/pages/detail_page.dart';
import 'package:veggy/ui/pages/homePage.dart';

Map<String, WidgetBuilder> getRoutesApp() {
  return <String, WidgetBuilder>{
    //Rutas de las páginas de la tienda
  //  '/': (BuildContext context) => HomePage(),
   '/': (BuildContext context) => DetailPage(),
  };
}