import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggy/ui/pages/homepage/cubits/carouselCubit/carousel_cubit.dart';
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
    return BlocBuilder<CarouselCubit, CarousellState>(
      builder: (context, state) {
        return Padding(
          padding: responsiveApp.edgeInsetsApp.allLargeEdgeInsets,
          // Si la aplicación corre en un dispositivo movil o tablet se muestra
          // una columna con las imagenes sino se muestra en forma de fila.
          child: isMobileAndTablet(context)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 24,
                          bottom: 14,
                          left: isMobile(context) ? 20 : 0),
                      child: Text(
                        'Destacado',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    Container(
                      width: responsiveApp.imageContainerwidth,
                      height: responsiveApp.imageContainerHeight,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(
                              responsiveApp.containerRadiusWidth)),
                          border: Border.all(color: Colors.white)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.network(
                          state.listFeatured[0],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: responsiveApp.imageContainerwidth,
                      height: responsiveApp.imageContainerHeight,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(
                              responsiveApp.containerRadiusWidth)),
                          border: Border.all(color: Colors.white)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.network(
                          state.listFeatured.length > 1
                              ? state.listFeatured[1]
                              : state.listFeatured[0],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                )
              :
              // Se muestra las imagenes en forma de fila en caso de ser un dispositivo de escritorio
              Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 24,
                          bottom: 14,
                          left: isMobile(context) ? 20 : 0),
                      child: Text(
                        'Destacado',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: responsiveApp.imageContainerwidth,
                          height: responsiveApp.imageContainerHeight,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  responsiveApp.containerRadiusWidth)),
                              border: Border.all(color: Colors.white)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: Image(
                              image: NetworkImage(state.listFeatured[0]),                  
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: responsiveApp.imageContainerwidth,
                          height: responsiveApp.imageContainerHeight,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  responsiveApp.containerRadiusWidth)),
                              border: Border.all(color: Colors.white)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: Image(
                              image: NetworkImage(state.listFeatured.length > 1
                                  ? state.listFeatured[1]
                                  : state.listFeatured[0]),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }
}
