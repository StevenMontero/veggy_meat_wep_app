import 'package:flutter/material.dart';
import 'package:veggy/util/sizingInfo.dart';
import 'package:veggy/values/responsiveApp.dart';
import 'package:google_fonts/google_fonts.dart';


//Error de borde en tablet

class ShoppingCart extends StatelessWidget {
  const ShoppingCart() : super();

  @override
  Widget build(BuildContext context) {
    final themeText = Theme.of(context).textTheme;
    final responsiveApp = ResponsiveApp(context);

    return Scrollbar(
        child: Container(
      color: Colors.grey[850],
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Material(
                    color: Colors.grey[850],
                    child: Text(
                      'Carrito de compras',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  SingleChildScrollView(
                    child: isMobileAndTablet(context)
                        ? listProductMovil(themeText, responsiveApp, context)
                        : listProduct(themeText, responsiveApp, context),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: resume(themeText, responsiveApp, context),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

//list.count
//recibir lista por parametro
//hasta .lenth
  Widget listProduct(
      TextTheme themeText, ResponsiveApp responsiveApp, BuildContext context) {
    return Material(
      child: Container(
        height: 800,
        width: 1100,
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return Container(
              height: 150,
              width: 800,
              color: Colors.grey[850],
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Image.network(
                        'https://s2.dia.es/medias/hb7/hc3/10643207847966.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Container(
                      color: Colors.grey[850],
                      height: 40,
                      width: 250,
                      child: Text(
                        'Nombre producto',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Container(
                      color: Colors.grey[850],
                      height: 50,
                      width: 100,
                      child: Text(
                        ' +  o  -',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Container(
                      color: Colors.grey[850],
                      height: 50,
                      width: 150,
                      child: Text(
                        '₡ ' + '1000',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget listProductMovil(
      TextTheme themeText, ResponsiveApp responsiveApp, BuildContext context) {
    return Material(
      child: Container(
        height: 650,
        width: 600,
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return Container(
              height: 150,
              width: 600,
              color: Colors.grey[850],
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Image.network(
                        'https://s2.dia.es/medias/hb7/hc3/10643207847966.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      color: Colors.grey[850],
                      height: 40,
                      width: 130,
                      child: Text(
                        'Nombre producto',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      color: Colors.grey[850],
                      height: 40,
                      width: 60,
                      child: Text(
                        ' +  o  -',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      color: Colors.grey[850],
                      height: 40,
                      width: 100,
                      child: Text(
                        '₡ ' + '123456',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Container resume(
      TextTheme themeText, ResponsiveApp responsiveApp, BuildContext context) {
    return Container(
        height: 300,
        width: 300,
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.deepOrange[800]),
        child: ListView(children: [
          Card(
            color: Colors.deepOrange[800],
            elevation: 0,
            child: ListTile(
              title: Text(
                'Resumen',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Card(
            color: Colors.deepOrange[800],
            elevation: 0,
            child: ListTile(
              title: Text(
                'Items',
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              trailing: Text(
                '3',
                textAlign: TextAlign.right,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Card(
            color: Colors.deepOrange[800],
            elevation: 0,
            child: ListTile(
              title: Text(
                'Envio',
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              trailing: Text(
                '1500',
                textAlign: TextAlign.right,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Card(
            color: Colors.deepOrange[800],
            elevation: 0,
            child: ListTile(
              title: Text(
                'Total',
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              trailing: Text(
                '10 000',
                textAlign: TextAlign.right,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Colors.green[900], padding: EdgeInsets.all(20)),
                child: Text(
                  'Resumen',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.25),
                )),
          )
        ]));
  }
}
