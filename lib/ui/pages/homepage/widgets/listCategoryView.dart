import 'package:flutter/material.dart';
import 'package:veggy/domain/models/category.dart';
import 'package:veggy/ui/pages/homepage/widgets/CategoryCard.dart';
import 'package:veggy/values/responsiveApp.dart';

// ignore: must_be_immutable
class ListCategoryView extends StatelessWidget {
  //ListCategoryView({Key? key}) : super(key: key);

  ResponsiveApp? responsiveApp;
  @override
  Widget build(BuildContext context) {
    responsiveApp = ResponsiveApp(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: responsiveApp!.edgeInsetsApp.onlyExLargeTopEdgeInsets,
          child: Text(
            'Nuestros Departamentos',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Padding(
          padding: responsiveApp!.edgeInsetsApp.allExLargeEdgeInsets,
          child: GridView.extent(
            maxCrossAxisExtent: 160,
            shrinkWrap: true,
            children: List.generate(
                categories.length,
                (index) => CategoryCard(
                      index: index,
                      onPress: () {},
                    )),
          ),
        ),
      ],
    );
  }
}
