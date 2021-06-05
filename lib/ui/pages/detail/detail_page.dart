import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veggy/ui/widgets/navbar.dart';
import 'package:veggy/ui/widgets/product_card.dart';
import 'package:veggy/util/sizingInfo.dart';
import 'package:veggy/values/responsiveApp.dart';

class DetailPage extends StatelessWidget {
  const DetailPage() : super();

  @override
  Widget build(BuildContext context) {
    final themeText = Theme.of(context).textTheme;
    final responsiveApp = ResponsiveApp(context);
    return Scaffold(
        appBar: Navbar(),
        body: Scrollbar(
          showTrackOnHover: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isMobileAndTablet(context))
                  SizedBox(
                    height: 50,
                  ),
                Center(
                  child: Card(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Container(
                          height: responsiveApp.width <= 1197 &&
                                  responsiveApp.width >= 900
                              ? 350
                              : isMobileAndTablet(context)
                                  ? 350
                                  : 400,
                          width: responsiveApp.width <= 1007 &&
                                  responsiveApp.width >= 900
                              ? 350
                              : isMobileAndTablet(context)
                                  ? 350
                                  : 400,
                          child: Image.network(
                            'https://s2.dia.es/medias/hb7/hc3/10643207847966.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        buildInfoProduct(themeText, responsiveApp, context)
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 24,
                            bottom: 14,
                            left: isMobile(context) ? 20 : 0),
                        child: Text(
                          'Productos relacionados',
                          style: themeText.headline6,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                            right: isMobile(context) ? 20 : 0,
                            left: isMobile(context) ? 20 : 0),
                        width: isMobile(context)
                            ? double.infinity
                            : isTablet(context)
                                ? 600
                                : 1000,
                        height: 350,
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ProductCard(
                                title: 'Papas',
                                subtitle: '500',
                                cornerIcon: Icons.ac_unit_outlined,
                                imageUrl: '',
                                onPressCard: () {},
                                onPressButton: () {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                )
              ],
            ),
          ),
        ));
  }

  Container buildInfoProduct(
      TextTheme themeText, ResponsiveApp responsiveApp, BuildContext context) {
    return Container(
      height: responsiveApp.width <= 1197 && responsiveApp.width >= 900
          ? 400
          : isMobileAndTablet(context)
              ? 370
              : 500,
      width: responsiveApp.width <= 1197 && responsiveApp.width >= 900
          ? 400
          : isMobileAndTablet(context)
              ? 600
              : 700,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 24,
              left: 24,
              top: 24,
            ),
            child: Text(
              'KELLOGGS cereales special k caja 500 gr',
              style: GoogleFonts.roboto(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.25),
              textScaleFactor: isDesktop(context) ? 1 : isMobileAndTablet(context) ? 0.7 : 0.9,
              textAlign: TextAlign.justify,
            ),
          ),
          isMobile(context)
              ? SizedBox(
                  height: 24,
                )
              : Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
            child: Container(
              child: Text(
                  'Arroz (47%), TRIGO integral (37%), azúcar, CEBADA (5%), sal, harina de malta de CEBADA,  extracto de malta  de CEBADA VITAMINAS Y MINERALES: Niacina, hierro, zinc, riboflavina, tiamina, vitamina B6, ácido fólico, vitamina D, vitamina B12',
                  style: themeText.bodyText1,
                  textAlign: TextAlign.justify,
                  textScaleFactor: isDesktop(context) ? 1: isMobileAndTablet(context) ? 0.9 : 1),
            ),
          ),
          isMobile(context)
              ? SizedBox(
                  height: 24,
                )
              : Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('AGREGAR'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.cyan, minimumSize: Size(700, 50)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 24, bottom: 24),
            child: isMobileAndTablet(context)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _createInfo(Icons.local_shipping, 'Servicio de envío',context),
                      SizedBox(width: 5,),
                      _createInfo(Icons.smartphone_rounded,
                          'Te avisamos antes de que llegue',context)
                    ],
                  )
                : Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _createInfo(
                          Icons.local_shipping, 'Servicio de envío', context),
                          SizedBox(width: 30,),
                      _createInfo(Icons.smartphone_rounded,
                          'Te avisamos antes de que llegue', context)
                    ],
                  ),
          )
        ],
      ),
    );
  }

  Widget _createInfo(IconData icon, String text, BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 24,
          color: Colors.green[200],
        ),
        SizedBox(
          width: 5.0,
        ),
        Text(text,
            textScaleFactor: isDesktop(context) ? 0.8 : 0.7,
            style: GoogleFonts.roboto(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w400,
                letterSpacing: 0.25)),
      ],
    );
  }
}
