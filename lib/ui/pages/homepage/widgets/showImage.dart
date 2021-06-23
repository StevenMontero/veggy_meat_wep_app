import 'package:flutter/material.dart';
import 'package:veggy/util/sizingInfo.dart';
import 'package:veggy/values/responsiveApp.dart';

class ShowImage extends StatefulWidget {
  @override
  _ShowImageState createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  late ResponsiveApp responsiveApp;
  @override
  Widget build(BuildContext context) {
    responsiveApp = ResponsiveApp(context);
    return Padding(
      padding: responsiveApp.edgeInsetsApp.allLargeEdgeInsets,
      // Si la aplicación corre en un dispositivo movil o tablet se muestra
      // una columna con las imagenes sino se muestra en forma de fila. 
      child: isMobileAndTablet(context)? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: responsiveApp.imageContainerwidth,
            height: responsiveApp.imageContainerHeight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(responsiveApp.containerRadiusWidth)),
                    border: Border.all(color: Colors.white)
                    ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                  child: Image.asset(
                    'assets/images/miércoles de feria copia.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned.fill(
                  top: 200,
                    child: Center(
                  child: Text('Floristería',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white)),
                ))
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            width: responsiveApp.imageContainerwidth,
            height: responsiveApp.imageContainerHeight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(responsiveApp.containerRadiusWidth)),
                    border: Border.all(color: Colors.white)),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                  child: Image.asset(
                    'assets/images/miércoles de feria copia.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned.fill(
                  top: 200,
                    child: Center(
                  child: Text('Miércoles de Feria',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white)),
                ))
              ],
            ),
          ),
        ],
      ): 
      // Se muestra las imagenes en forma de fila en caso de ser un dispositivo de escritorio
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(              
            width: responsiveApp.imageContainerwidth,
            height: responsiveApp.imageContainerHeight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(responsiveApp.containerRadiusWidth)),
                    border: Border.all(color: Colors.white)
                    ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                  child: Image.asset(
                    'assets/images/miércoles de feria copia.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned.fill(
                  top: 200,
                    child: Center(
                  child: Text('Miércoles de Feria',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white)),
                ))
              ],
            ),
          ),

          SizedBox(
            width: 12,
          ),

          Container(
            width: responsiveApp.imageContainerwidth,
            height: responsiveApp.imageContainerHeight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(responsiveApp.containerRadiusWidth)),
                    border: Border.all(color: Colors.white)),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                  child: Image.asset(
                    'assets/images/miércoles de feria copia.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned.fill(
                  top: 200,
                    child: Center(
                  child: Text('Floristería',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white)),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
