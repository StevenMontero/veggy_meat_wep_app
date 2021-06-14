import 'package:flutter/material.dart';
//import 'package:sign_button/sign_button.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class BottomBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(color: Colors.grey[800]),
      child: Row(
        children: [
          Container(
            margin: new EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Center(
                    child: Text(
                      '¿Quiere recibir',
                      style: TextStyle(
                        foreground: Paint()
                          ..color = Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      'descuentos y noticias?',
                      style: TextStyle(
                        foreground: Paint()
                          ..color = Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ),
          Container(
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              children: [
                Container(
                  margin: new EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      ' Ingrese su correo electrónico ',
                      style: TextStyle(
                        foreground: Paint()
                          ..color = Colors.black,
                      ),
                    ),
                ),
                Container(
                  height: 30,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.cyan,
                      ),
                      onPressed: null,
                      child: Text(
                        ' Enviar ',
                        style: TextStyle(
                          foreground: Paint()
                            ..color = Colors.white,
                        ),
                      ),
                    )
                )
              ], //
            ),
          ),
          Spacer(),
          Align(
            //alignment: Alignment.centerRight,
            child: Container(
              margin: new EdgeInsets.symmetric(horizontal: 10.0),
              //mainAxisAlignment: MainAxisAlignment.right,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: new EdgeInsets.symmetric(vertical: 10.0),
                    height: 34.0,
                    child: Center(
                      child: Container(
                        child: Image.asset('logoTemp.png'),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        'Siguenos en nuestras redes sociales',
                        style: TextStyle(
                          foreground: Paint()
                            ..color = Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: new EdgeInsets.symmetric(horizontal: 5.0),

                          child: SignInButton(
                            Buttons.Facebook,
                            mini: true, onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius. circular(10.0),
                            ),
                          ),
                        ),
                        Container(
                          margin: new EdgeInsets.symmetric(horizontal: 5.0),
                          child: SignInButton(
                            Buttons.Twitter,
                            mini: true, onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius. circular(10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
