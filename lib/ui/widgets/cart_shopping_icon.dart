import 'package:flutter/material.dart';

class IconCartShoppingIndicator extends StatelessWidget {
  const IconCartShoppingIndicator() : super();

  @override
  Widget build(BuildContext context) {
    return IconButton(
        hoverColor: Colors.green[50],
        icon: Stack(
          children: [
            Icon(
              Icons.shopping_cart,
              size: 30.0,
              color: Colors.green,
            ),
            3 == 0
                ? new Container()
                : new Positioned(
                    child: new Stack(children: <Widget>[
                    new Icon(Icons.brightness_1_rounded,
                        size: 25.0, color: Colors.green[300]),
                    new Positioned(
                        top: 7,
                        right: 4.7,
                        child: new Center(
                          child: new Text(
                            '190',
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ))
                  ])),
          ],
        ),
        onPressed: () {});
  }
}
